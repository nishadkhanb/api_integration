import 'package:flutter/material.dart';

class nik extends StatefulWidget {
  const nik({super.key});

  @override
  State<nik> createState() => _nikState();
}

class _nikState extends State<nik> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('nishad',style: TextStyle(color: Colors.brown,fontSize: 20),),
    );
  }
}
