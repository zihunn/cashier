import 'package:flutter/material.dart';
import 'package:kasir/model/menu_model.dart';
import 'package:kasir/utils/constant.dart';
import 'package:kasir/utils/navigation_helper.dart';
import 'package:lottie/lottie.dart';
import 'color.dart';
import 'package:lottie/lottie.dart';

final numberController = TextEditingController();

dialogAddTable(var provider) => showDialog(
    context: navigatorKey.currentContext!,
    builder: ((context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(10),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              padding:
                  EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                      controller: numberController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kCyan,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kCyan,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Add New Table",
                          hintStyle: TextStyle(color: Colors.black54)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        provider.addTable(numberController.text);
                        provider.getTable();
                        numberController.clear();

                        goBack();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Add Table",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Image.asset(
                            "assets/images/add.png",
                            width: 16,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: kPrimaryColor,
                          side: const BorderSide(color: kCyan),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -45,
              child: Image.asset(
                "assets/images/dinner.png",
                width: 74.0,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      );
    }));

dialogSuccess(var provider, text) => showDialog(
      context: navigatorKey.currentContext!,
      builder: ((context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                width: 280,
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 70),
                      child: Text(
                        text,
                        style: headingStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 35,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          provider.getMenu();
                          goBack();

                          goBack();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Oke",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: kPrimaryColor,
                            side: const BorderSide(color: kCyan),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -50,
                child: Lottie.asset(
                  "assets/lottie/1success.json",
                  width: 150.0,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
      }),
    );
dialogFailed(var provider) => showDialog(
      context: navigatorKey.currentContext!,
      builder: ((context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                width: 280,
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 70),
                      child: Text(
                        "Check product information again",
                        style: headingStyle2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 35,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Oke",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: kPrimaryColor,
                            side: const BorderSide(color: kCyan),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -55,
                child: Lottie.asset(
                  "assets/lottie/failed.json",
                  width: 130.0,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
      }),
    );
dialogWarning(var provider, final Datum data) => showDialog(
      context: navigatorKey.currentContext!,
      builder: ((context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                width: 280,
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 70),
                      child: Text(
                        "are you sure you want to delete it",
                        style: headingStyle2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 35,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              var index = 0;
                              var listMenu = provider.listMenu;
                              var menu = listMenu[index];
                              // Navigator.pop(context);
                              provider.deleteMenu(data.id);
                              provider.getMenu();
                              goBack();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Color(0xffADE792),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "No",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Color(0xffDC3535),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -55,
                child: Lottie.asset(
                  "assets/lottie/alert.json",
                  width: 130.0,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        );
      }),
    );

dialogLoading() => showDialog(
      barrierColor: Colors.transparent,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(100),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Lottie.asset("assets/lottie/loading.json")],
          ),
        );
      },
    );
