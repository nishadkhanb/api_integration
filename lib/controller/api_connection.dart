

import 'dart:convert';

import 'package:app_1/models/products_model.dart';
import 'package:http/http.dart' as http;

class APIConnection{

  String ab = 'asd';

   Future<List<ProductsModel>> fetchProducts()async{
     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

     if(response.statusCode == 200){
       List<dynamic> data = jsonDecode(response.body);

       return data.map((json) => ProductsModel.fromJson(json)).toList();
     }else{
       throw Exception('Failed to fetch products');
     }
   }
}