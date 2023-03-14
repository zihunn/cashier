// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kasir/provider/auth_provider.dart';
import 'package:kasir/utils/animation.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/custom_snackbar.dart';
import '../../utils/navigation_helper.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var _index = 0;
  var _posisiSelectedValue;
  final _posisi = [
    "waiter",
    "cashier",
  ];

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, authProv, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  goBack();
                },
                icon: Image.asset(
                  "assets/images/left.png",
                  width: 30.0,
                ),
              ),
            ),
            body: FadeAnimation(
              1.6,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: const Text(
                          "Choose Account Type",
                          style: TextStyle(
                              color: kBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _posisiSelectedValue = _posisi[0];
                                print(_posisiSelectedValue);
                                _index = 1;
                                setState(() {});
                              },
                              child: Image.asset(
                                "assets/images/Waiters-pana.png",
                                width: 150,
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  minimumSize: Size.zero, // Set this
                                  padding: EdgeInsets.zero,
                                  primary: _index == 1
                                      ? kPrimaryColor
                                      : kSecondaryColor,
                                  side: const BorderSide(color: kBlue),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _posisiSelectedValue = _posisi[1];
                                print(_posisiSelectedValue);
                                _index = 2;
                                setState(() {});
                              },
                              child: Image.asset(
                                "assets/images/cashier.png",
                                width: 150,
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  minimumSize: Size.zero, // Set this
                                  padding: EdgeInsets.zero,
                                  primary: _index == 2
                                      ? kPrimaryColor
                                      : kSecondaryColor,
                                  side: const BorderSide(color: kBlue),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 14),
                          child: Column(
                            children: [
                              Text(
                                _index != 1 ? "Hallo Cashier" : "Hallo Waiter",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.grey
                                      : Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "please fill out the form below to create account",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.grey
                                      : Colors.white,
                                ),
                              ),
                            ],
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        child: Column(
                          children: [
                            FadeAnimation(
                              1.6,
                              TextField(
                                style: TextStyle(
                                  color: Color(0xff282828),
                                ),
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                    color: Color(0xff282828),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff282828),
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: const Icon(
                                    Ionicons.person,
                                    color: Color(0xff282828),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            FadeAnimation(
                              1.6,
                              TextField(
                                style: TextStyle(
                                  color: Color(0xff282828),
                                ),
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Color(0xff282828),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff282828),
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: const Icon(
                                    Ionicons.mail_outline,
                                    color: Color(0xff282828),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            FadeAnimation(
                              1.6,
                              TextField(
                                style: TextStyle(
                                  color: Color(0xff282828),
                                ),
                                controller: passwordController,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Color(0xff282828),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff282828),
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: const Icon(
                                    Ionicons.lock_closed_outline,
                                    color: Color(0xff282828),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }

                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty &&
                                _posisiSelectedValue.isNotEmpty) {
                              Map<String, dynamic> requestBody = {
                                'role': _posisiSelectedValue
                                    .toString()
                                    .toLowerCase(),
                                'email': emailController.text,
                                'password': passwordController.text,
                                'name': nameController.text,
                              };
                              print(requestBody);
                              authProv.register(requestBody);
                            } else {
                              errorSnackBar('lengkapi data terlebih dahulu');
                            }
                          },
                          // ignore: sort_child_properties_last
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Create Account",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              elevation: 0,
                              primary: kPrimaryColor,
                              side: const BorderSide(color: kBlue),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
