import 'package:flutter/material.dart';

class Drawerdetails extends StatelessWidget {

  const Drawerdetails({required this.name,required this.age,super.key});
  final String name;
  final int age;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text(name),
        actions: [Text(age.toString())],
      ),
    );
  }
}
