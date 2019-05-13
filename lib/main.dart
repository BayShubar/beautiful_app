import 'package:flutter/material.dart';

import './pages/auth/signin_page.dart';


class MainApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/': (BuildContext context)=> SigninPage()
      },
    );
  }
}

main(){
  return runApp(MainApp());
}