import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kasir/models/menu_model.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constant.dart';

class MenuRepository {
  // Get All Menu
  Future<List<MenuModel>> getAllMenu() async {
    var response = await http.get(
      Uri.parse('$url/menus'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      final data = json.map((e) {
        return MenuModel(
            id: e['id'],
            name: e['name'],
            price: e['price'],
            stock: e['stock'],
            description: e['description'],
            category: e['category'],
            image: e['image']);
      }).toList();

      return data;
    }
    return [];
  }

  // Get Drink
  Future<List<MenuModel>> getDrink() async {
    var response = await http.get(
      Uri.parse('$urlDrink'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      final data = json.map((e) {
        return MenuModel(
            id: e['id'],
            name: e['name'],
            price: e['price'],
            stock: e['stock'],
            description: e['description'],
            category: e['category'],
            image: e['image']);
      }).toList();
      print(data);
      return data;
    }
    return [];
  }

  // Get Food
  Future<List<MenuModel>> getFood() async {
    var response = await http.get(
      Uri.parse('$urlFood'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      final data = json.map((e) {
        return MenuModel(
            id: e['id'],
            name: e['name'],
            price: e['price'],
            stock: e['stock'],
            description: e['description'],
            category: e['category'],
            image: e['image']);
      }).toList();
      print(data);
      return data;
    }
    return [];
  }

  // Get Dessert
  Future<List<MenuModel>> getDessert() async {
    var response = await http.get(
      Uri.parse('$urlDessert'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      final data = json.map((e) {
        return MenuModel(
            id: e['id'],
            name: e['name'],
            price: e['price'],
            stock: e['stock'],
            description: e['description'],
            category: e['category'],
            image: e['image']);
      }).toList();
      print(data);
      return data;
    }
    return [];
  }

  // Future addMenu(data) async {
  //   try {
  //     final response = await http.post(Uri.parse('$url/menus'), body: data);

  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (err) {
  //     print(err);
  //   }
  // }
  static Future addMenu(data) async {
    String fileName = data["image"] != null
        ? data["image"].path.split("/").last
        : "https://picsum.photos/500/300";

    FormData formData = FormData.fromMap({
      "image": data["image"] != null
          ? await MultipartFile.fromFile(data["image"].path, filename: fileName)
          : "https://picsum.photos/500/300",
      "name": data["name"],
      "price": data["price"],
      "stock": data["stock"],
      "description": data["description"],
      "category": data["category"],
    });

    var res = await dio.post(
      "$url/menus",
      data: formData,
    );

    log(res.realUri.toString());

    if (res.statusCode == 200) {
      return res.data;
    }
  }

  Future deleteMenu(String id) async {
    try {
      final response = await http.delete(Uri.parse("$url/menus/"), body: {
        'id': id,
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}