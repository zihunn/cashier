import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kasir/view/register.dart';
import 'package:provider/provider.dart';

import '../utils/color.dart';
import '../utils/constant.dart';
import '../utils/navigation_helper.dart';
import 'dashboard_admin.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 350.0,
          decoration: const BoxDecoration(
            color: kBlueSoft,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 300),
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 70),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintStyle: TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(16),
                              prefixIcon: const Icon(
                                Ionicons.mail_outline,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintStyle: TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(16),
                              prefixIcon: const Icon(
                                Ionicons.lock_closed_outline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("No account?"),
                            TextButton(
                              onPressed: () {
                                goPush(RegisterView());
                              },
                              child: Text("Signup"),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            goRemove(DashboardAdminView());
                          },
                          // ignore: sort_child_properties_last
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              elevation: 0,
                              primary: kPrimaryColor,
                              side: const BorderSide(color: kBlue),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 375,
          left: 60,
          child: Column(
            children: [
              Text(
                "Login",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 26.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "please fill out the form below to get started",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 175,
          left: 100,
          child: Container(
            child: Image.asset(
              "assets/images/rocket.png",
              width: 200,
              color: Colors.grey,
            ),
          ),
        ),
        Positioned(
          top: 170,
          left: 100,
          child: Container(
            child: Image.asset(
              "assets/images/rocket.png",
              width: 200,
            ),
          ),
        ),
      ],
    ));
  }
}

class ClipWave extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double marginTop = height * 1 / 3;

    Path path = Path();

    path.moveTo(0, marginTop);
    path.cubicTo(
      width * 1 / 2,
      (height / 4) + marginTop,
      width * 3 / 7,
      -(height / 25) + marginTop,
      width * 3 / 4,
      marginTop,
    );

    path.cubicTo(
      width * 4 / 6,
      (height / 4) + marginTop,
      width * 6 / 13,
      -(height / 10) + marginTop,
      width * 2 / 2,
      marginTop,
    );

    path.lineTo(width, height);
    path.lineTo(0, height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
