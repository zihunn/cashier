import 'package:flutter/material.dart';
import 'package:kasir/model/user_model.dart';
import 'package:kasir/provider/user_provider.dart';
import 'package:kasir/component/appbar.dart';
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
    return ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
      child: Consumer<UserProvider>(
        builder: (context, userProv, child) {
          var listUser = userProv.listUser;
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
                  child: userProv.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: listUser?.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var user = listUser?[index];

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
                                    user!.name,
                                    style: titleStyle,
                                  ),
                                  subtitle: Text(
                                    user.role,
                                    style: subtitleStyle,
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      userProv.deleteUser(user.id);
                                      userProv.getUser();
                                      // userProv.deleteUser(user.id);
                                      // userProv.getUser();
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
