import 'package:flutter/material.dart';
import 'package:kasir/provider/menu_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';

class DrinkList extends StatefulWidget {
  const DrinkList({super.key});

  @override
  State<DrinkList> createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuProvider(),
      child: Consumer<MenuProvider>(
        builder: (context, menuProv, child) {
          var drinks = menuProv.drink;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 15.0,
            ),
            itemCount: drinks.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var drink = drinks[index];

              return Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // image: DecorationImage(
                          //   image: NetworkImage(item.image),
                          //   fit: BoxFit.contain,
                          // ),
                        ),
                        child: Image.network(
                          drink.image,
                          width: 40,
                          height: 40,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Text('😢');
                          },
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
                              drink.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
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
                                  drink.price,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: kCyan,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
