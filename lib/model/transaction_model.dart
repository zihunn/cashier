// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
    TransactionModel({
        required this.data,
        required this.success,
        required this.message,
    });

    List<Completed> data;
    bool success;
    String message;

    factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        data: List<Completed>.from(json["data"].map((x) => Completed.fromJson(x))),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "message": message,
    };
}

class Completed {
    Completed({
        required this.id,
        required this.customerName,
        this.customerAddress,
        required this.status,
        required this.total,
        required this.paymentMethod,
        required this.payment,
        required this.change,
        required this.cashierId,
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
    String paymentMethod;
    String payment;
    String change;
    String cashierId;
    String waiterId;
    String tableNumber;
    DateTime createdAt;
    DateTime updatedAt;

    factory Completed.fromJson(Map<String, dynamic> json) => Completed(
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
