import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:study_squad/services/auth.dart';
import 'package:study_squad/shared/loading.dart';

import '../routes.dart';
class Register extends StatefulWidget {
  Function toggle;
  Register({super.key, required this.toggle});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _formKey=GlobalKey();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final AuthService _authService=AuthService();
  String error="";
  bool loading=false;
  @override
  void initState() {
    super.initState();
    emailController= TextEditingController();
    passwordController= TextEditingController();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
        backgroundColor: Color.fromRGBO(240, 219, 205,1),
        body: LayoutBuilder(
          builder: (context, constraints){
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: constraints.maxHeight*0.1, left: 30, right: 30),
                        padding: EdgeInsets.all(17),
                        child: Icon(Icons.account_circle, size: 100,)
                      ),
                      Container(
                        margin: EdgeInsets.only(top:0, left: 30, right: 30, bottom: 20),
                        padding: EdgeInsets.all(17),
                        child: Text(
                          "Create new \nAccount",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),

                      TextFormField(
                        validator: (val)=> val!.isEmpty ? 'Please Enter Your Email': null,
                        controller: emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        validator: (val)=> val!.length<6 ? "Password must be longer than 6 characters" : null,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20)
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),

                        ),
                        onPressed: () async{
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              loading=true;
                            });
                            try{
                              dynamic currUser=await _authService.registerWithEmailAndPassword(emailController.text, passwordController.text);
                              if(currUser==null){
                                setState(() {
                                  loading=false;
                                  error="Invalid Credentials";
                                });
                              }
                            }catch(e){
                              print(e.toString() +"error");
                            }
                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      Text("Already have an Account?", style: TextStyle(fontSize: 16),),
                      TextButton(
                        child: Text('Login!'),
                        onPressed: (){
                          widget.toggle();
                        },
                      ),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                        ),

                      ),
                    ],
                  ),
                ),
              )
              ,
            );
          },
        ),
    );
  }
}
