
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_squad/authentication/authenticate.dart';
import 'package:study_squad/screens/login.dart';
import 'package:study_squad/models/curr_user.dart';
import 'package:study_squad/screens/home.dart';
import 'package:study_squad/screens/verification_screen.dart';
import 'package:study_squad/services/auth.dart';
class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool showVerificationScreen=true;
  void showHome(){
    setState(() {
      showVerificationScreen=false;
    });

  }
  Widget build(BuildContext context) {
    CurrUser? currUser=Provider.of<CurrUser?>(context);
    if(currUser==null){
      return Authenticate();
    }else{
      if(showVerificationScreen && !currUser.emailVerified){
        return VerificationScreen(toggle: showHome);
      }else{
        return Home();
      }

    }
  }
}
