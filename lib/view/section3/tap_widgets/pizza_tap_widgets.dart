import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../helper/responsive.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/remove_favorite_dialog.dart';


class PizzaTapWidgets extends StatefulWidget {
  @override
  _PizzaTapWidgetsState createState() => _PizzaTapWidgetsState();
}

class _PizzaTapWidgetsState extends State<PizzaTapWidgets> {
  List<String> favoritePizzas = [];

  final List<Map<String, String>> pizzas = [
    {
      "image": "assets/pizza1.png",
      "name": "Pepperoni pizza",
      "description":
          "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
      "price": "\$29",
    },
    {
      "image": "assets/pizza2.png",
      "name": "Pizza Cheese ",
      "description":
          "Food pizza dish cuisine junk food, Fast Food, Flatbread, Ingredient",
      "price": "\$23",
    },
    {
      "image": "assets/pizza3.png",
      "name": "Peppy Paneer",
      "description": "Chunky paneer with crisp capsicum and spicy red pepper",
      "price": "\$13",
    },
    {
      "image": "assets/pizza4.png",
      "name": "Mexican Green Wave",
      "description":
          "A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes",
      "price": "\$23",
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
            mainAxisSpacing: 20, // تصغير التباعد بين العناصر
            mainAxisExtent: 260, // جعل ارتفاع الكارد متغيرًا حسب المحتوى
          ),
          itemCount: pizzas.length,
          itemBuilder: (context, index) {
            return PizzaCard(
              imagePath: pizzas[index]["image"]!,
              pizzaName: pizzas[index]["name"]!,
              description: pizzas[index]["description"]!,
              isFavorite: favoritePizzas.contains(pizzas[index]["name"]!),
              price: pizzas[index]["price"]!,
              onFavoriteToggle: (name, isFavorite) {
                setState(() {
                  isFavorite
                      ? favoritePizzas.add(name)
                      : favoritePizzas.remove(name);
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class PizzaCard extends StatefulWidget {
  final String imagePath;
  final String pizzaName;
  final String description;
  final bool isFavorite;
  final Function(String, bool) onFavoriteToggle;
  final String price;

  const PizzaCard({
    Key? key,
    required this.imagePath,
    required this.pizzaName,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.price,
  }) : super(key: key);

  @override
  _PizzaCardState createState() => _PizzaCardState();
}

class _PizzaCardState extends State<PizzaCard> {
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
                    widget.pizzaName,
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
        Positioned(bottom: 80,left: 60,
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
              color: Colors.green[100],
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
                                widget.onFavoriteToggle(widget.pizzaName, isFavorite);
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
                      widget.onFavoriteToggle(widget.pizzaName, isFavorite);
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
