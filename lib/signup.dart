import 'package:app_1/bottomnavigationbar.dart';
import 'package:app_1/controler/services.dart';
import 'package:app_1/controller/controller.dart';
import 'package:app_1/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:intl/intl.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  //TextEditingController dob = TextEditingController();
  TextEditingController ph = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  AuthServices authServices = AuthServices();

  // String userid = 'abhiram';
  // String userpass = '000000';
  //
  //
  // Future checkUser(String username, String password, String phone) async {
  //   await authServices.checkSignedIn();
  //   if (username == userid && password == userpass) {
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => Bottomna(),
  //     ));
  //     // Fluttertoast.showToast(
  //     //     msg: 'Toast Message', gravity: ToastGravity.BOTTOM);

  //-----------------------------------------------------
  // showSuccess(context,authServices.userName);
  // showToast("toast bar",duration:3,gravity: ToastGravity.BOTTOM);
  // final snackBar = SnackBar(
  //   backgroundColor: Colors.green,
  //   content: Text('logging you in'),
  //   duration: Duration(seconds: 5),
  // );
  //
  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   } else {
  //     final snackBar = SnackBar(
  //       backgroundColor: Colors.red,
  //       content: Text('invalid data'),
  //       duration: Duration(seconds: 5),
  //     );
  //
  //     // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   }
  // }
  //snackbar

  final services = Services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Form(
              key: loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'WELCOME TO MY PAGE',
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                  ),

                  Text('Already a user',style: TextStyle(color: Colors.blue,fontSize: 20),),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.blue)),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Signin()));
                      },

                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.red, fontSize: 30),
                      )),
                  Text('Create an account',style: TextStyle(color: Colors.blue,fontSize: 20),),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this field is required";
                      } else {
                        return null;
                      }
                    },
                    controller: name,
                    decoration: const InputDecoration(
                      hintText: "enter login id",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this field is required";
                      } else {
                        return null;
                      }
                    },
                    controller: pass,
                    decoration: const InputDecoration(
                      hintText: "enter password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this field is required";
                      } else {
                        return null;
                      }
                    },
                    controller: ph,
                    decoration: const InputDecoration(
                      hintText: "enter phone number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // TextFormField(
                  //   onTap: () {
                  //     services.pickdate(context, dob);
                  //   },
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "this field is required";
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  //   controller: dob,
                  //   decoration: const InputDecoration(
                  //     suffixIcon: Icon(Icons.date_range),
                  //     hintText: "enter date",
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue)),
                      onPressed: () {
                        if (loginKey.currentState!.validate()) {
                          authServices.setSignIn(name.text, pass.text, ph.text);
                        }
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.red, fontSize: 30),
                      )),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// void showToast(String msg, {int? duration, int? gravity}) {
//   Toast.show(msg, duration: duration, gravity: gravity);
// }
void showSuccess(BuildContext context, String userName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Welcome Mr $userName"),
        content: Text("login successful"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("ok")),
        ],
      );
    },
  );
}
