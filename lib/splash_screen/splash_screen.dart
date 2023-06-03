import 'package:flutter/material.dart';
import '../login_screen/view/login.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/Splashscreen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetoLogin();
  }

  _navigatetoLogin() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.of(context).pushReplacementNamed(Login.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/moto_splash.gif'),
      ),
    );
  }
}
