import 'package:flutter/material.dart';
import 'package:study_squad/screens/login.dart';
import 'package:study_squad/screens/register.dart';
class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogIn=true;
  void toggle(){
    setState(() {
      showLogIn=!showLogIn;
    });

  }
  @override
  Widget build(BuildContext context) {
    if(showLogIn){
      return Login(toggle: toggle,);
    }else{
      return Register(toggle: toggle,);
    }
  }
}
