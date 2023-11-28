import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_squad/models/curr_user.dart';
import 'package:study_squad/services/auth.dart';
import 'package:study_squad/shared/constants.dart';
class VerificationScreen extends StatefulWidget {
  Function toggle;
  VerificationScreen({super.key, required this.toggle});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  void _startReloading() async {
    User? currUser=await FirebaseAuth.instance.currentUser;
    await currUser!.reload();
    if(currUser!.emailVerified){
      widget.toggle();
    }
    // Periodically update the counter every 5 seconds
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        // Add logic here for reloading data or performing other actions
      });
      // Restart the process to reload again
      _startReloading();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startReloading();

  }
  @override
  void dispose()  {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    User? currUser=FirebaseAuth.instance.currentUser;
    currUser!.reload();
    AuthService _authService= AuthService();
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
                "Verification email has been sent to $email, You will be automatically redirected once you verify. If not,  click on Refresh button",
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
              SizedBox(height: 30,),
              Center(
                child: ElevatedButton(
                  style: buttonStyle,
                  child: Text("Go to Login Screen"),
                  onPressed: () async{
                    await _authService.logout();

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
