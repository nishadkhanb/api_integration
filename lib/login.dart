import 'package:app_1/controller/controller.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});
  

  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    TextEditingController passWord = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    AuthServices authServices=AuthServices();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'login page',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: userName,
              decoration: const InputDecoration(
                hintText: "enter user name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passWord,
              decoration: const InputDecoration(
                hintText: "enter password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // TextFormField(
            //   controller: phoneNumber,
            //   decoration: const InputDecoration(
            //     hintText: "enter the phone number",
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),

            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () {
                  authServices.login(userName.text, passWord.text, context);
                },
                child: const Text(
                  'save',
                  style: TextStyle(color: Colors.red, fontSize: 30),
                )),
          ]),
        ),
      ),
    );
  }
}
