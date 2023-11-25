import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_squad/models/curr_user.dart';
import 'package:study_squad/routes.dart';
import 'package:study_squad/screens/bookings.dart';
import 'package:study_squad/screens/bookmarks.dart';
import 'package:study_squad/screens/home.dart';
import 'package:study_squad/authentication/login.dart';
import 'package:study_squad/screens/profile.dart';
import 'package:study_squad/authentication/register.dart';
import 'package:study_squad/services/auth.dart';
import 'package:study_squad/wrapper.dart';

import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrUser?>.value(
      value: AuthService().currUser,
      initialData: null,
      child: MaterialApp(
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
        home: Wrapper(),
      ),
    );
  }
}
