// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    CartModel({
        required this.cart,
        required this.success,
        required this.message,
    });

    List<Cart> cart;
    bool success;
    String message;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
        "success": success,
        "message": message,
    };
}

class Cart {
    Cart({
        required this.id,
        required this.qty,
        required this.subtotal,
        required this.waiterId,
        required this.menuId,
        required this.menu,
    });

    int id;
    String qty;
    String subtotal;
    String waiterId;
    String menuId;
    Menu menu;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        qty: json["qty"],
        subtotal: json["subtotal"],
        waiterId: json["waiter_id"],
        menuId: json["menu_id"],
        menu: Menu.fromJson(json["menu"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "qty": qty,
        "subtotal": subtotal,
        "waiter_id": waiterId,
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
