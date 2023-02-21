import 'package:flutter/material.dart';
import 'package:kasir/model/menu_model.dart';
import 'package:kasir/provider/auth_provider.dart';
import 'package:kasir/utils/constant.dart';
import 'package:provider/provider.dart';
import '../view/history.dart';

class DrawerView extends StatelessWidget {
  final MenuModel? data;
  const DrawerView({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, authProv, child) {
          // var data = authProv.list;
          return SizedBox(
            width: 240,
            child: Drawer(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 30),
                            child: Row(
                              children: [
                                CircleAvatar(
                                    radius: 24,
                                    backgroundImage:
                                        AssetImage("assets/images/team.png")),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(user!.role),
                                    Text("87391276"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Divider(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 3,
                          child: ListTile(
                              leading: Image.asset(
                                "assets/images/logout.png",
                                width: 30,
                              ),
                              title: Text('Logout'),
                              onTap: () {
                                AuthProvider().logout();
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
