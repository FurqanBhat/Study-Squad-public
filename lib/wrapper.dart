import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_squad/authentication/authenticate.dart';
import 'package:study_squad/authentication/login.dart';
import 'package:study_squad/models/curr_user.dart';
import 'package:study_squad/screens/home.dart';
class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    CurrUser? currUser=Provider.of<CurrUser?>(context);
    print("bakcklfa");
    if(currUser==null){
      print("curruser=null");
      return Authenticate();
    }else{
      return Home();
    }
  }
}
