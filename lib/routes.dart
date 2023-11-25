
import 'package:flutter/material.dart';
import 'package:study_squad/screens/bookmarks.dart';
import 'package:study_squad/screens/home.dart';
import 'package:study_squad/screens/login.dart';
import 'package:study_squad/screens/profile.dart';
import 'package:study_squad/screens/register.dart';
import 'package:study_squad/screens/settings.dart';

class RouteManager{
  static const String home='/';
  static const String settingsPage='/settings';
  static const String bookmarks='/bookmarks';
  static const String login='/login';
  static const String register='/register';

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case register:
        return MaterialPageRoute(builder: (context)=>Register());
      case login:
        return MaterialPageRoute(builder: (context)=>Login());
      case home:
        return MaterialPageRoute(builder: (context)=>Home());
      case settingsPage:
        return MaterialPageRoute(builder: (context)=>Settings());
      case bookmarks:
        return MaterialPageRoute(builder: (context)=>Bookmarks());
      default:
        return MaterialPageRoute(builder: (context)=>Profile());
    }
  }

}