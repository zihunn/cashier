import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kasir/models/menu_model.dart';
import 'package:kasir/utils/modal.dart';

import '../../utils/constant.dart';
import '../../widget/appbar.dart';

class EditMenuVIew extends StatefulWidget {
  final MenuModel? data;
  final provider;
  const EditMenuVIew({
    Key? key,
    this.provider,
    this.data,
  }) : super(key: key);

  @override
  State<EditMenuVIew> createState() => _EditMenuVIewState();
}

class _EditMenuVIewState extends State<EditMenuVIew> {
  File? image;
  var _value = "-1";
  List<String> data = [
    "food",
    "drink",
    "dessert",
  ];
  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print(image);
    }
  }

  Future getPhoto() async {
    try {
      final foto1 = await ImagePicker().pickImage(source: ImageSource.camera);
      if (foto1 == null) return;

      final image1Temporary = File(foto1.path);
      setState(() => this.image = image1Temporary);
    } on PlatformException catch (e) {
      print("Failed to pick a image : $e");
    }
  }

  selectImage(getImage) => {
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text("Silahkan pilih media untuk upload"),
              content: Container(
                height: height / 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        getImage();
                      },
                      icon: Icon(Icons.image),
                    ),
                    IconButton(
                      onPressed: () {
                        getPhoto();
                      },
                      icon: Icon(Icons.camera),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      };

  var _categorySelectedValue;
  final priceController = TextEditingController();
  final nameController = TextEditingController();
  final stockController = TextEditingController();

  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppbar(
          text: "Edit Menu",
        ),
        preferredSize: const Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Card(
                elevation: 3,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Informasi Product",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: IconButton(
                            onPressed: () {
                              selectImage(getImage);
                            },
                            icon: Image.asset("assets/images/camera.png")),
                      ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        child: image != null
                            ? Image.file(
                                image!,
                              )
                            : Image.network(
                                widget.data!.image,
                                width: 64.0,
                                height: 64.0,
                              ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixText: widget.data!.name,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
                          labelText: "Type Menu Name",
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      DropdownSearch<String>(
                        label: widget.data!.category,
                        items: data,
                        mode: Mode.MENU,
                        popupItemDisabled: (String s) => s.startsWith('I'),
                        // selectedItem: ,
                        onChanged: (value) {
                          setState(() {
                            _categorySelectedValue = value;
                            print(_categorySelectedValue);
                          });
                        },
                        dropdownSearchDecoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              )),
                          labelText: "Category",
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: priceController,
                        decoration: InputDecoration(
                          prefixText: "Rp  ${widget.data!.price}",
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
                          labelText: "Selling Price",
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: stockController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
                          labelText: "Stock",
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 40),
                          labelText: "Description Menu",
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    child: ElevatedButton(
                      onPressed: () async {
                        var data = {
                          "name": nameController.text,
                          "price": priceController.text,
                          "stock": stockController.text,
                          "description": descriptionController.text,
                          "category": _categorySelectedValue,
                          "image": image
                        };
                        widget.provider.editMenu(data);
                        widget.provider.getAllMenu2();
                        // dialogSuccess(widget.provider);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Save",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Color(0xffA6F3EB),
                          side: BorderSide(color: Color(0xff0EB7B0)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
