import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../helper/responsive.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/remove_favorite_dialog.dart';
class BurgerTapWidgets extends StatefulWidget {
  @override
  _BurgerTapWidgetsState createState() => _BurgerTapWidgetsState();
}

class _BurgerTapWidgetsState extends State<BurgerTapWidgets> {
  List<String> favoriteBurgers = [];

  final List<Map<String, String>> burgers = [
    {
      "image": "assets/burger1.png", // صورة البرغر الأولى
      "name": "Classic Burger",
      "description":
      "Juicy beef patty, lettuce, tomato, cheese, and classic burger sauce.",
      "price": "\$12",
    },
    {
      "image": "assets/burger2.png", // صورة البرغر الثانية
      "name": "Cheese Burger",
      "description":
      "Cheddar cheese melted over a grilled beef patty with fresh vegetables.",
      "price": "\$15",
    },
    {
      "image": "assets/burger2.png", // صورة البرغر الثالثة
      "name": "Spicy Chicken Burger",
      "description": "Crispy chicken patty with spicy mayo and jalapeños.",
      "price": "\$14",
    },
    {
      "image": "assets/burger1.png", // صورة البرغر الرابعة
      "name": "Vegan Burger",
      "description":
      "Grilled veggie patty with lettuce, tomato, and vegan mayo.",
      "price": "\$13",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 100, top: 35),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            mainAxisExtent: 260,
          ),
          itemCount: burgers.length,
          itemBuilder: (context, index) {
            return BurgerCard(
              imagePath: burgers[index]["image"]!,
              burgerName: burgers[index]["name"]!,
              description: burgers[index]["description"]!,
              isFavorite: favoriteBurgers.contains(burgers[index]["name"]!),
              price: burgers[index]["price"]!,
              onFavoriteToggle: (name, isFavorite) {
                setState(() {
                  isFavorite
                      ? favoriteBurgers.add(name)
                      : favoriteBurgers.remove(name);
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class BurgerCard extends StatefulWidget {
  final String imagePath;
  final String burgerName;
  final String description;
  final bool isFavorite;
  final Function(String, bool) onFavoriteToggle;
  final String price;

  const BurgerCard({
    Key? key,
    required this.imagePath,
    required this.burgerName,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.price,
  }) : super(key: key);

  @override
  _BurgerCardState createState() => _BurgerCardState();
}

class _BurgerCardState extends State<BurgerCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: responsiveHeight(context, 250),
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.grey[300]!),
            ),
            color: Colors.white,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 45, horizontal: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.burgerName,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  SizedBox(height: responsiveHeight(context, 10)),

                  Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.flash_on,
                              color: Colors.orange,
                              size: 13,
                            ),
                          ),

                          Flexible(
                            child: Text(
                              widget.description,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                  letterSpacing: -0.1
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      )
                  ),

                ],
              ),
            ),
          ),
        ),
        Positioned(bottom: 80, left: 60,
          child: Text(widget.price,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
        ),

        Positioned(
          top: -40,
          left: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              color: Colors.grey[300],
              height: responsiveHeight(context, 98),
              width: responsiveWidth(context, 98),
              child: Image.asset(
                widget.imagePath,
                height: responsiveHeight(context, 70),
                width: responsiveWidth(context, 70),
              ),
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: -4,
          left: 130,
          bottom: 235,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color:  Colors.green[100],
              height: responsiveHeight(context, 30),
              width: responsiveWidth(context, 28),
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  if (isFavorite) {

                    showDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.5),
                      builder: (context) {
                        return Stack( children: [
                          BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(color: Colors.black.withOpacity(0.2)),

                          ),

                          RemoveFavoriteDialog(
                            onConfirm: () {
                              setState(() {
                                isFavorite = false;
                                widget.onFavoriteToggle(widget.burgerName, isFavorite);
                              });
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              Navigator.pop(context);
                            },
                          ),]
                        );
                      },
                    );
                  } else {
                    setState(() {
                      isFavorite = true;
                      widget.onFavoriteToggle(widget.burgerName, isFavorite);
                    });
                  }
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 30,
          child: CustomButton(
            onPress: () {},
            backgroundColor:  Color(0xFF25AE4B),
            height: responsiveHeight(context, 35),
            width: responsiveWidth(context, 110),
            title: "Order Now",
            borderRadius: 25,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
