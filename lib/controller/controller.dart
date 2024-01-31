import 'package:app_1/bottomnavigationbar.dart';
import 'package:app_1/signup.dart';
import 'package:app_1/page1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  String? _userName;
  String get userName => _userName!;
  String? _passWord;
  String get passWord => _passWord!;
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber!;

  Future<void> checkSignedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _isSignedIn = sharedPreferences.getBool('is_signedIn') ?? false;
    _userName = sharedPreferences.getString('userName');
    _passWord = sharedPreferences.getString('passWord');
    _phoneNumber = sharedPreferences.getString('phoneNumber');
  }

  Future setSignIn(String userName, String passWord, String phoneNumber) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('is_signedIn', true);
    sharedPreferences.setString('userName', userName);
    sharedPreferences.setString('passWord', passWord);
    sharedPreferences.setString('phoneNumber', phoneNumber);
    _isSignedIn = true;
    print('data saved successfully, $userName , $passWord , $phoneNumber');
  }
  Future login(String user,String pass,context) async{
    await checkSignedIn();
    if(user==userName&&pass==passWord){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Bottomna()),);
    }

  }

  // Future getString(String userName) async {
  //   final SharedPreferences sharedPreferences =
  //   await SharedPreferences.getInstance();
  //   // sharedPreferences.setBool('is_signedIn', true);
  //   sharedPreferences.setString('userName', userName);
  //   _isSignedIn = true;
  // }

  Future setSignOut() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('is_signedIn', false);
    _isSignedIn = false;
  }

  Future<void> gotoNext(context) async {
    // await Future.delayed(Duration(seconds: 3));
    await checkSignedIn();
    if (isSignedIn == true) {
      print("User Name : $userName");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Bottomna(),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Login(),
      ));
    }
  }
}
