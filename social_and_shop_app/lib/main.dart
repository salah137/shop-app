import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_and_shop_app/screens/LoginScreen.dart';
import 'package:social_and_shop_app/screens/RegisterScreen.dart';

import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: "Teko Bold"
          ),
          bodyText2: TextStyle(
            fontFamily:"Teko Light"
          )
        )
      ),
      home: LoginScreen(),
    );
  }
}

