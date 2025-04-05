import 'package:flutter/material.dart';

import '../../../helper/responsive.dart';
import '../../../widgets/custom_button_widget.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final String? description;
  final String? image;
  final num? price;
  final String? float;
  final String? numline;

  DetailsPage({
    required this.title,
    this.description,
    this.image,
    this.price,
    this.float,
    this.numline,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double _spiciness = 0; 
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                widget.image!,
                height: responsiveHeight(context, 203),
                width: responsiveWidth(context, 370),
              ),
              SizedBox(height: responsiveHeight(context, 15)),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Color(0xFFFFC107)),
                        Icon(Icons.star, color: Color(0xFFFFC107)),
                        Icon(Icons.star, color: Color(0xFFFFC107)),
                        Icon(Icons.star, color: Color(0xFFFFC107)),
                        Icon(Icons.star_half, color: Color(0xFFFFC107)),
                        Text(
                          "4.5 (89 reviews)",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: responsiveHeight(context, 10)),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '\$ ${widget.price}',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '${widget.float} ',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '\$${widget.numline} ',
                          style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: responsiveHeight(context, 15)),
                    Text(
                      "Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                        letterSpacing: -.4,
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 20)),
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Spicy",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SliderTheme(data: SliderThemeData(
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                                 ),
                              child: Slider(
                                value: _spiciness,
                                min: 0,
                                max: 10,
                                activeColor: Colors.red,
                                inactiveColor: Colors.grey.shade300,
                                onChanged: (value) {
                                  setState(() {
                                    _spiciness = value;
                                  });
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Mild",
                                  style: TextStyle(color: Colors.green),
                                ),
                                SizedBox(width: responsiveWidth(context, 170)),
                                Text("Hot", style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Quantity",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed:
                                      _quantity > 1
                                          ? () {
                                            setState(() {
                                              _quantity--;
                                            });
                                          }
                                          : null,
                                  icon: Container(
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                SizedBox(width: responsiveWidth(context, 11)),
                                Padding(
                                  padding: const EdgeInsets.only(right: 11),
                                  child: Text(
                                    '$_quantity',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (_quantity < 10) {
                                      setState(() {
                                        _quantity++;
                                      });
                                    }
                                  },
                                  icon: Container(
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
        
                  ],
                ),
              ),
              SizedBox(height: responsiveHeight(context, 20),),
              CustomButton(onPress: (){}, backgroundColor: Color(0xFF25AE4B), height: responsiveHeight(context, 52),width: responsiveWidth(context, 350), title: "Add To Cart")
            ],
          ),
        ),
      ),
    );
  }
}
