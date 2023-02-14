// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

AccountModel accountModelFromJson(String str) => AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
    AccountModel({
        required this.success,
        required this.message,
        required this.account,
        required this.token,
        required this.type,
    });

    bool success;
    String message;
    Account account;
    String token;
    String type;

    factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        success: json["success"],
        message: json["message"],
        account: Account.fromJson(json["account"]),
        token: json["token"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "account": account.toJson(),
        "token": token,
        "type": type,
    };
}

class Account {
    Account({
        required this.id,
        required this.name,
        required this.email,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String name;
    String email;
    String role;
    DateTime createdAt;
    DateTime updatedAt;

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

