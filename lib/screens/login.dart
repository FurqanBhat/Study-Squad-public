import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(240, 219, 205,1),
        body: LayoutBuilder(
          builder: (context, constraints){
            return Form(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: constraints.maxHeight*0.15, left: 30, right: 30),
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.account_circle, size: 100,)
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 20),
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),

                      TextFormField(
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
                        obscureText: true,
                        controller: emailController,
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
                          'Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),

                        ),
                        onPressed: (){},
                      ),
                      TextButton(
                        child: Text('Forgot password'),
                        onPressed: (){},
                      ),
                      TextButton(
                        child: Text('Signup!'),
                        onPressed: (){},
                      ),
                    ],
                  ),
                ),
              )
              ,
            );
          },
        ),
      ),
    );
  }
}
