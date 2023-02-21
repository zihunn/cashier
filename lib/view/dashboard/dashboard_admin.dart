import 'package:flutter/material.dart';
import 'package:kasir/component/category.dart';
import 'package:kasir/model/account_model.dart';
import 'package:kasir/model/table_model.dart';
import 'package:kasir/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import '../../utils/navigation_helper.dart';
import '../../component/navigationDrawer.dart';
import '../cart_admin.dart';

class DashboardAdminView extends StatefulWidget {
  final Account? data;
  const DashboardAdminView({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<DashboardAdminView> createState() => _DashboardAdminViewState();
}

class _DashboardAdminViewState extends State<DashboardAdminView> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider(),
      child: Consumer<DashboardProvider>(
        builder: (context, dashProv, child) {
          var user = widget.data;
          var test = dashProv.listTable;
          return Scaffold(
            endDrawer: NavigationDrawerView(
              data: user,
              // data: data,
            ),
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

                              setState(() {
                                dashProv.getByCategory("food");
                              });
                              print(user);
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
                              dashProv.getByCategory("drink");
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
                              dashProv.getByCategory("dessert");
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
                      dashProv.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : dashProv.listMenu!.isEmpty
                              ? Center(
                                  child: Text("text"),
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                    mainAxisSpacing: 20.0,
                                    crossAxisSpacing: 15.0,
                                  ),
                                  itemCount: dashProv.listMenu!.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var data = dashProv.listMenu?[index];

                                    return dashProv.listMenu == null
                                        ? Center(
                                            child: Text("text"),
                                          )
                                        : CategoryCard(
                                            data: data,
                                            provider: dashProv,
                                            user: user,
                                          );
                                  },
                                ),
                      Positioned(
                        bottom: 30,
                        right: 10,
                        child: FloatingActionButton.extended(
                          elevation: 2,
                          onPressed: () {
                            setState(() {
                              dashProv.init();
                              goPush(CartAdminView(test: test));
                            });
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
