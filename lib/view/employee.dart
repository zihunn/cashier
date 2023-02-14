import 'package:flutter/material.dart';
import 'package:kasir/models/user_model.dart';
import 'package:kasir/provider/user_provider.dart';
import 'package:kasir/widget/appbar.dart';
import 'package:provider/provider.dart';
import '../utils/color.dart';
import '../utils/constant.dart';

class EmployeView extends StatefulWidget {
  const EmployeView({Key? key}) : super(key: key);

  @override
  State<EmployeView> createState() => _EmployeViewState();
}

class _EmployeViewState extends State<EmployeView> {
  final _colors = [kSecondaryColor, kBlueSoft];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: Consumer<UserProvider>(
        builder: (context, value, child) {
          var users = value.listUser;
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: CustomAppbar(text: "Employee")),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 12.0,
                    ),
                    decoration: BoxDecoration(
                      color: kBlueSoft,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[400]!,
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/search.png",
                            width: 30.0,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: null,
                            decoration: const InputDecoration.collapsed(
                              filled: true,
                              fillColor: kBlueSoft,
                              hoverColor: Colors.transparent,
                              hintText: "Search",
                            ),
                            onFieldSubmitted: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var user = users[index];

                      print(role);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Card(
                          color: _colors[index % _colors.length],
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/employee.png",
                              width: 40,
                            ),
                            title: Text(
                              "${user.name}",
                              style: titleStyle,
                            ),
                            subtitle: Text(
                              "${user.role}",
                              style: subtitleStyle,
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                UserProvider().deleteUser("${user.id}");
                              },
                              icon: Image.asset(
                                "assets/images/trash.png",
                                width: 30.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
