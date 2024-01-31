
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String tittle;
  final String? subtittle;
  const Details({required this.tittle,this.subtittle,super.key,});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(tittle,style: TextStyle(color: Colors.black),),
        actions: [Text(subtittle!)],
      ),
    );
  }
}
