import 'package:flutter/material.dart';
import 'package:study_squad/routes.dart';
import 'package:study_squad/screens/bookings.dart';
import 'package:study_squad/screens/bookmarks.dart';
import 'package:study_squad/screens/home.dart';
import 'package:study_squad/screens/login.dart';
import 'package:study_squad/screens/profile.dart';
import 'package:study_squad/screens/register.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          secondary: Color(0xFFEE8B1C),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        )
      ),
      onGenerateRoute: RouteManager.generateRoute,
      home: Home(),
    );
  }
}
