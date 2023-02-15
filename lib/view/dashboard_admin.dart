import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/menu_provider.dart';
import '../utils/color.dart';
import '../utils/constant.dart';
import '../utils/navigation_helper.dart';
import '../widget/navigationDrawer.dart';
import 'cart_admin.dart';

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
      child: Scaffold(
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
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
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
                            primary:
                                _index == 1 ? kPrimaryColor : kSecondaryColor,
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
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Stack(children: [
                  Consumer<MenuProvider>(
                    builder: (context, value, child) {
                      var drinks = value.drink;
                      var foods = value.food;
                      // var desserts = value.dessert;
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 15.0,
                        ),
                        itemCount: foods.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var drink = drinks[index];
                          var food = foods[index];
                          // var dessert = desserts[index];
                          return Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: NetworkImage(_index == 0
                                            ? "${drink.stock}"
                                            : "${food.stock}"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${drink.name}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 37),
                                              height: 8,
                                              width: 8,
                                              decoration: const BoxDecoration(
                                                  color: Colors.amber,
                                                  shape: BoxShape.circle),
                                            ),
                                            const SizedBox(
                                              width: 8.0,
                                            ),
                                            Text(
                                              "${drink.price}",
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: kCyan,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                "assets/images/minus.png",
                                                width: 24.0,
                                              ),
                                            ),
                                            Text("1"),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                "assets/images/add.png",
                                                width: 24.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
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
      ),
    );
  }
}
