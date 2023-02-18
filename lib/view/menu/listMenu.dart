import 'package:flutter/material.dart';
import 'package:kasir/models/menu_model.dart';
import 'package:kasir/provider/menu_provider.dart';
import 'package:kasir/view/menu/edit_menu.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';
import '../../utils/constant.dart';
import '../../utils/modal.dart';
import '../../utils/navigation_helper.dart';
import '../../widget/appbar.dart';
import 'add_menu.dart';

class ListMenuView extends StatefulWidget {
  ListMenuView({
    Key? key,
  }) : super(key: key);

  @override
  State<ListMenuView> createState() => _ListMenuViewState();
}

class _ListMenuViewState extends State<ListMenuView> {
  final _colors = [kSecondaryColor, kBlueSoft];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuProvider(),
      child: Consumer<MenuProvider>(
        builder: (context, menuProv, child) {
          var allMenu = menuProv.allMenu;
          return Scaffold(
            appBar: PreferredSize(
              child: CustomAppbar(
                text: "Menu",
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
                          // dialogAddMenu(menuProv);
                          goPush(AddMenuView(provider: menuProv));
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
                              leading: Image.network(
                                "${menu.image}",
                                width: 64.0,
                                height: 64.0,
                                fit: BoxFit.fill,
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
                                  onPressed: () {
                                    goPush(
                                      EditMenuVIew(
                                        data: menu,
                                        provider: menuProv,
                                      ),
                                    );
                                  },
                                  icon: Image.asset(
                                    "assets/images/edit.png",
                                    height: 26,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    print("s");
                                    dialogWarning(menuProv, menu);

                                    // widget.provider.deleteMenu(widget.data!.id);
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
