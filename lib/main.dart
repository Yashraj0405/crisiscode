import 'package:flutter/material.dart';
import './splash_screen/splash_screen.dart';
import './qr_screen/view/qr_screen.dart';
import 'login_screen/view/login.dart';
import './signup/view/signUp.dart';
import 'constants/theme.dart';
import './profile_screen/view/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
        body: SplashScreen(),
      ),
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        Login.routeName: (context) => Login(),
        SignUp.routeName: (context) => SignUp(),
        QRScreen.routeName: (context) => QRScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}
