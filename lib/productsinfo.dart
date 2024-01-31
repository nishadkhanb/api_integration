import 'package:flutter/material.dart';

import 'models/products_model.dart';

class Info extends StatelessWidget {
  const Info({
    super.key,
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
  final int? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image!))),
          ),
          Text("Product id:${
            id!.toString()}",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "₹${price!.toString()}",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        SizedBox(
            height: 20,
          ),
        Text("Product description:${
            description!}",
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        ],
      ),
    );
  }
}
