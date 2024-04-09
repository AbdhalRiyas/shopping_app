import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_treinetic/models/product.dart';

class ProductService extends ChangeNotifier {
  List<Product> productList = [];
  Product product = Product();
  List<String> catagoryList = [];
  Future<void> getAllProducts({
    required BuildContext context,
  }) async {
    try {
      var headers = {"Content-Type": "application/json"};

      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        final responseData = json.decode(response.body);
        for (int i = 0; i < responseData.length; i++) {
          productList.add(Product.fromJson(responseData[i]));
          print(productList[i].toJson());
        }
      } else {
        // If the server returns an unexpected response, log the status code and response body.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.body)),
        );
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // If an error occurs, log the error message and throw an exception.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      throw Exception('Failed to load data: $e');
    }
  }

  Future<void> getProduct({
    required BuildContext context,
    required int id,
  }) async {
    try {
      var headers = {"Content-Type": "application/json"};

      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/$id'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        final responseData = json.decode(response.body);
        product = Product.fromJson(responseData);
      } else {
        // If the server returns an unexpected response, log the status code and response body.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.body)),
        );
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // If an error occurs, log the error message and throw an exception.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      throw Exception('Failed to load data: $e');
    }
  }

  Future<void> getCatagories({
    required BuildContext context,
  }) async {
    try {
      var headers = {"Content-Type": "application/json"};

      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/categories'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        final responseData = json.decode(response.body);
        for (int i = 0; i < responseData.length; i++) {
          catagoryList.add(responseData[i]);
        }
        print(catagoryList);
      } else {
        // If the server returns an unexpected response, log the status code and response body.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.body)),
        );
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // If an error occurs, log the error message and throw an exception.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      throw Exception('Failed to load data: $e');
    }
  }
}
