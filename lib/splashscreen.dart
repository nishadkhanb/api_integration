import 'package:app_1/controller/controller.dart';
import 'package:app_1/signup.dart';
import 'package:app_1/page1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // static const String _isLoggedInKey = 'isLoggedin';
  // static const String _usernameKey = 'isLoggedin';
  // static Future<bool> isLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool(_isLoggedInKey) ?? false;
  // }
  //
  // gotohome(context){
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(),));
  // }
  // gotologin(context){
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(),));
  // }

  AuthServices authServices = AuthServices();

  @override
  void initState() {
    authServices.checkSignedIn();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authServices.gotoNext(context);
    return Scaffold(
        body: Center(child: CircularProgressIndicator(),));
  }
}
