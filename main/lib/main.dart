import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_and_shop_app/layouts/HomeLayout.dart';
import 'package:social_and_shop_app/screens/LoginScreen.dart';
import 'package:social_and_shop_app/screens/RegisterScreen.dart';
import 'package:social_and_shop_app/shared/cubit/AppCubit.dart';

import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
                bodyText1: TextStyle(fontFamily: "Teko Bold"),
                bodyText2: TextStyle(fontFamily: "Teko Light"))),
        home: HomePage(),
      ),
    );
  }
}
