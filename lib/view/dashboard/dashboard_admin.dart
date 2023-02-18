import 'package:flutter/material.dart';
import 'package:kasir/widget/list%20menu/dessert.dart';
import 'package:kasir/widget/list%20menu/drink.dart';
import 'package:kasir/widget/list%20menu/food.dart';
import 'package:provider/provider.dart';

import '../../provider/menu_provider.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import '../../utils/navigation_helper.dart';
import '../../widget/navigationDrawer.dart';
import '../cart_admin.dart';

class DashboardAdminView extends StatefulWidget {
  const DashboardAdminView({Key? key}) : super(key: key);

  @override
  State<DashboardAdminView> createState() => _DashboardAdminViewState();
}

class _DashboardAdminViewState extends State<DashboardAdminView> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuProvider(),
      child: Consumer<MenuProvider>(
        builder: (context, menuProv, child) {
          var desserts = menuProv.dessert;
          var drinks = menuProv.drink;
          var foods = menuProv.food;
          return Scaffold(
            endDrawer: const NavigationDrawerView(),
            //APPBAR
            appBar: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6, right: 14, top: 10),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("brunch", style: headingStyle),
                        Text("Restaurnt", style: headingStyle),
                      ],
                    ),
                    actions: [
                      Builder(
                        builder: (context) {
                          return IconButton(
                            icon: Image.asset(
                              "assets/images/menu.png",
                              width: 40,
                            ),
                            onPressed: () =>
                                Scaffold.of(context).openEndDrawer(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                preferredSize: const Size.fromHeight(60)),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Categories
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _index = 0;
                              menuProv.getFood();
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                const Text(
                                  "Food",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Image.asset(
                                  "assets/images/diet.png",
                                  width: 20,
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsets.all(10),
                              primary:
                                  _index == 0 ? kPrimaryColor : kSecondaryColor,
                              side: const BorderSide(color: kCyan),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _index = 1;
                              menuProv.getDrink();
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                const Text(
                                  "Drink",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Image.asset(
                                  "assets/images/drink.png",
                                  width: 20,
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: EdgeInsets.all(10),
                                primary: _index == 1
                                    ? kPrimaryColor
                                    : kSecondaryColor,
                                side: const BorderSide(color: kCyan),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _index = 2;
                              menuProv.getDessert();
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                const Text(
                                  "Dessert",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Image.asset(
                                  "assets/images/ice-cream.png",
                                  width: 16,
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsets.all(11),
                              primary:
                                  _index == 2 ? kPrimaryColor : kSecondaryColor,
                              side: const BorderSide(color: kCyan),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //ItemCard

                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Stack(children: [
                      _index == 0
                          ? FoodList()
                          : _index == 1
                              ? DrinkList()
                              : DessertList(),
                      Positioned(
                        bottom: 30,
                        right: 10,
                        child: FloatingActionButton.extended(
                          elevation: 2,
                          onPressed: () {
                            goPush(const CartAdminView());
                          },
                          extendedPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          label: const Text('Cart'),
                          icon: Image.asset(
                            "assets/images/online-shopping.png",
                            width: 30.0,
                          ),
                          backgroundColor: kCyan,
                        ),
                      ),
                    ]),
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
