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

    List<Datum> data;
    bool success;
    String message;

    factory PendingModel.fromJson(Map<String, dynamic> json) => PendingModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
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
        this.discount,
        this.cashier,
        required this.waiter,
        required this.items,
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
    dynamic discount;
    dynamic cashier;
    Waiter waiter;
    List<Item> items;

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
        discount: json["discount"],
        cashier: json["cashier"],
        waiter: Waiter.fromJson(json["waiter"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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
        "discount": discount,
        "cashier": cashier,
        "waiter": waiter.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        required this.id,
        required this.qty,
        required this.subtotal,
        required this.transactionId,
        required this.menuId,
        required this.menu,
    });

    int id;
    String qty;
    String subtotal;
    String transactionId;
    String menuId;
    Menu menu;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        qty: json["qty"],
        subtotal: json["subtotal"],
        transactionId: json["transaction_id"],
        menuId: json["menu_id"],
        menu: Menu.fromJson(json["menu"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "qty": qty,
        "subtotal": subtotal,
        "transaction_id": transactionId,
        "menu_id": menuId,
        "menu": menu.toJson(),
    };
}

class Menu {
    Menu({
        required this.id,
        required this.name,
        required this.price,
        required this.stock,
        required this.description,
        required this.category,
        required this.image,
    });

    int id;
    String name;
    String price;
    String stock;
    String description;
    String category;
    String image;

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        stock: json["stock"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "stock": stock,
        "description": description,
        "category": category,
        "image": image,
    };
}

class Waiter {
    Waiter({
        required this.id,
        required this.name,
        required this.email,
        required this.role,
    });

    int id;
    String name;
    String email;
    String role;

    factory Waiter.fromJson(Map<String, dynamic> json) => Waiter(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
    };
}
