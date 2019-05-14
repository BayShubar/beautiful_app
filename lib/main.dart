import 'package:flutter/material.dart';

import './pages/auth/signin_page.dart';
import './pages/onboarding/onboarding_page.dart';


class MainApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/signin': (BuildContext context)=> SigninPage(),
        '/': (BuildContext context)=> OnboardingPage(),
      },
    );
  }
}

main(){
  return runApp(MainApp());
}