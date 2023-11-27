import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:study_squad/models/curr_user.dart';
class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;

  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=userCredential.user;
      user!.sendEmailVerification();
      return _currUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future loginWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user=userCredential.user;
      return _currUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future logout() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }




  CurrUser? _currUser(User? user){
    if(user!=null){
      print(user.emailVerified);
    }
    return user == null ? null : CurrUser(uid: user.uid, emailVerified: user.emailVerified);
  }

  Stream<CurrUser?> get currUser{
    return _auth.authStateChanges().map(_currUser);
  }

}