// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

import 'package:kasir/model/table_model.dart';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String menuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
    MenuModel({
        required this.data,
        required this.success,
        required this.message,
    });

    List<Datum>? data;
    bool success;
    String message;

    factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        data: List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
    };
}

class Datum {
    Datum({
        required this.name,
        required this.price,
        required this.stock,
        required this.category,
        required this.description,
        required this.image,
        required this.id,
    });

    String name;
    String price;
    String stock;
    String category;
    String description;
    String image;
    int id;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        price: json["price"],
        stock: json["stock"],
        category: json["category"],
        description: json["description"],
        image: json["image"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "stock": stock,
        "category": category,
        "description": description,
        "image": image,
        "id": id,
    };
}
