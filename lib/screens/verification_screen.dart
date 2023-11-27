import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_squad/models/curr_user.dart';
import 'package:study_squad/shared/constants.dart';
class VerificationScreen extends StatefulWidget {
  Function toggle;
  VerificationScreen({super.key, required this.toggle});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    User? currUser=FirebaseAuth.instance.currentUser;
    String? email=currUser!.email;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 15, right: 15),
        padding: EdgeInsets.all(13),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Text(
                "Verification email has been sent to $email, Please verify it and then click on Refresh button",
                textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                )
              ),
              SizedBox(height: 30,),
              Center(
                child: ElevatedButton(
                  style: buttonStyle,
                  child: Text("Refresh"),
                  onPressed: () async{
                    await FirebaseAuth.instance.currentUser!.reload();
                    final verified= await currUser!.emailVerified;
                    if(verified){
                      widget.toggle();
                    }else{
                      setState(() {
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: ElevatedButton(
                  style: buttonStyle,
                  child: Text("Wrong Email"),
                  onPressed: () async{
                    await currUser!.delete();
                  },
                ),
              ),

              SizedBox(height: 30,),
              Center(
                child: ElevatedButton(
                  style: buttonStyle,
                  child: Text("Resend Email"),
                  onPressed: () async{
                    await currUser!.sendEmailVerification();

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
