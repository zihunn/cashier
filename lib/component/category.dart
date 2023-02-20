import 'package:flutter/material.dart';
import 'package:kasir/model/menu_model.dart';
import 'package:kasir/utils/color.dart';

class CategoryCard extends StatefulWidget {
  final Datum? data;
  final provider;
  const CategoryCard({Key? key, this.data, this.provider}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
                widget.data!.image,
                width: 64.0,
                height: 64.0,
                fit: BoxFit.fill,
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
                    widget.data!.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                            color: Colors.amber, shape: BoxShape.circle),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        widget.data!.price,
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
    ;
  }
}
