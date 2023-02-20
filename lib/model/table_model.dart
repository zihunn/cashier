// To parse this JSON data, do
//
//     final tableModel = tableModelFromJson(jsonString);

import 'dart:convert';

TableModel tableModelFromJson(String str) => TableModel.fromJson(json.decode(str));

String tableModelToJson(TableModel data) => json.encode(data.toJson());

class TableModel {
    TableModel({
        required this.data,
        required this.success,
        required this.message,
    });

    List<Meja> data;
    bool success;
    String message;

    factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        data: List<Meja>.from(json["data"].map((x) => Meja.fromJson(x))),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "message": message,
    };
}

class Meja {
    Meja({
        required this.number,
    });

    String number;

    factory Meja.fromJson(Map<String, dynamic> json) => Meja(
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
    };
}
