import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kasir/provider/menu_provider.dart';
import 'package:kasir/view/add_menu.dart';
import 'package:provider/provider.dart';
import '../utils/color.dart';
import '../utils/constant.dart';
import '../utils/navigation_helper.dart';
import '../widget/appbar.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({Key? key}) : super(key: key);

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  final _colors = [kSecondaryColor, kBlueSoft];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuProvider(),
      child: Consumer<MenuProvider>(
        builder: (context, value, child) {
          var allMenu = value.allMenu;
          return Scaffold(
            appBar: PreferredSize(
              child: CustomAppbar(
                text: "Edit Menu",
              ),
              preferredSize: const Size.fromHeight(60),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          goPush(AddMenuView());
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/shopping-bag.png",
                              width: 20,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Add New Menu",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 26),
                            primary: kPrimaryColor,
                            side: BorderSide(color: kCyan),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: allMenu.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var menu = allMenu[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          color: _colors[index % _colors.length],
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Image.network(
                                  "${menu.image}",
                                  width: 64.0,
                                  height: 64.0,
                                ),
                              ),
                              title: Text(
                                "${menu.name}",
                                style: titleStyle,
                              ),
                              subtitle: Text(
                                "${menu.price}",
                                style: subtitleStyle,
                              ),
                              trailing: Wrap(spacing: 0, children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/images/edit.png",
                                    height: 26,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    print("s");
                                    MenuProvider().deleteMenu("${menu.id}");
                                  },
                                  icon: Image.asset(
                                    "assets/images/trash.png",
                                    height: 26,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        );
                      },
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
