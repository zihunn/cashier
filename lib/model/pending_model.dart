// To parse this JSON data, do
//
//     final pendingModel = pendingModelFromJson(jsonString);

import 'dart:convert';

PendingModel pendingModelFromJson(String str) => PendingModel.fromJson(json.decode(str));

String pendingModelToJson(PendingModel data) => json.encode(data.toJson());

class PendingModel {
    PendingModel({
        required this.data,
        required this.success,
        required this.message,
    });

    List<Datum>? data;
    bool success;
    String message;

    factory PendingModel.fromJson(Map<String, dynamic> json) => PendingModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
        required this.id,
        required this.customerName,
        this.customerAddress,
        required this.status,
        required this.total,
        this.paymentMethod,
        this.payment,
        this.change,
        this.cashierId,
        required this.waiterId,
        required this.tableNumber,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String customerName;
    dynamic customerAddress;
    String status;
    String total;
    dynamic paymentMethod;
    dynamic payment;
    dynamic change;
    dynamic cashierId;
    String waiterId;
    String tableNumber;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        customerName: json["customer_name"],
        customerAddress: json["customer_address"],
        status: json["status"],
        total: json["total"],
        paymentMethod: json["payment_method"],
        payment: json["payment"],
        change: json["change"],
        cashierId: json["cashier_id"],
        waiterId: json["waiter_id"],
        tableNumber: json["table_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_name": customerName,
        "customer_address": customerAddress,
        "status": status,
        "total": total,
        "payment_method": paymentMethod,
        "payment": payment,
        "change": change,
        "cashier_id": cashierId,
        "waiter_id": waiterId,
        "table_number": tableNumber,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
