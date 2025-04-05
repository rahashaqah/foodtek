import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../helper/responsive.dart';
import '../details_product&filter/home_Product.dart';
class AllTapWidget extends StatefulWidget {
  @override
  _AllTapWidgetState createState() => _AllTapWidgetState();
}

class _AllTapWidgetState extends State<AllTapWidget> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: responsiveHeight(context, 650),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPromoBanner(),

          _buildPageIndicators(),
          SizedBox(height: responsiveHeight(context, 10)),
          Text(
            'Top Rated',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          _buildTopRatedList(),
          SizedBox(height: responsiveHeight(context, 5)),
          Row(
            children: [
              Text(
                'Recommend',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: responsiveWidth(context, 180)),
              Text(
                'View All ',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 12, color: Colors.green),
            ],
          ),
          SizedBox(height: responsiveHeight(context, 10)),
          _buildRecommendedList(),
        ],
      ),
    );
  }

  Widget _buildPromoBanner() {
    return SizedBox(
      height: responsiveHeight(context, 125),
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: responsiveHeight(context, 140),
                    width: responsiveWidth(context, 380),
                    child: Image.asset("assets/Frame71.png", fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Experience our '.tr,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      'delicious new dish'.tr,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      '30% OFF'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Padding(
      padding: EdgeInsets.only(top: 7, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 2),
            height: responsiveHeight(context, 4),
            width: _currentPage == index ? 15 : 15,
            decoration: BoxDecoration(
              color: _currentPage == index ? Colors.green : Colors.grey[400],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopRatedList() {
    List<Map<String, dynamic>> topRatedItems = [
      {
        "image": "assets/burger1.png",
        "title": "Chicken Burger",
        "description": "100 gr chicken + tomato + cheese  Lettuce",
        "rating": 3.8,
        "price": 25,
        "float": ".00",
        "numline": "9.5",
      },

      {
        "image": "assets/burger2.png",
        "title": "Beef Steak",
        "description": "100 gr meat + onion + tomato + Lettuce cheese",
        "rating": 4.8,
        "price": 50,
        "float": ".00",
        "numline": "25.5",
      },
      {
        "image": "assets/burger1.png",
        "title": "Vegetarian Pizza",
        "description": "100 gr chicken + tomato + cheese  Lettuce",
        "rating": 3.8,
        "price": 30,
        "float": ".00",
        "numline": "15.5",
      },
      {
        "image": "assets/burger1.png",
        "title": "Grilled Salmon",
        "description": "100 gr chicken + tomato + cheese  Lettuce",
        "rating": 4.9,
        "price": 60,
        "float": ".00",
        "numline": "30.5",
      },
      {
        "image": "assets/img.png",
        "title": "Cheeseburger Wendy's Burger",
        "description": "100 gr chicken + tomato + cheese  Lettuce",
        "rating": 4.5,
        "price": 7,
        "float": ".99",
        "numline": "9.5",
      },
    ];

    return SizedBox(
      height: responsiveHeight(context, 220),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topRatedItems.length,
        itemBuilder: (context, index) {
          return _buildFoodCard(
            topRatedItems[index]["title"],
            topRatedItems[index]["rating"],
            topRatedItems[index]["price"],
            topRatedItems[index]["image"],
            topRatedItems[index]["description"],
            topRatedItems[index]["float"],
            topRatedItems[index]["numline"],
          );
        },
      ),
    );
  }

  Widget _buildFoodCard(
    String title,
    double rating,
    num price,
    String image,
    String description,
    String float,
    String numline,
  ) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => Home2Product(
            title: title,
            description: description,
            image: image,
            price: price.toInt(),
            float: float,
            numline: numline,
          ),
        );
      },
      child: Container(
        height: responsiveHeight(context, 0),
        width: responsiveWidth(context, 175),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey[300]!),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 100, bottom: 1),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '★ ',
                        style: TextStyle(color: Color(0xFFFF9F06)),
                      ),
                      TextSpan(
                        text: '$rating',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                image,
                height: responsiveHeight(context, 86),
                width: responsiveWidth(context, 150),
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  description,
                  style: TextStyle(color: Colors.grey[500], fontSize: 11.5),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 65, top: 10, left: 6),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '\$ $price',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: '$float',
                            style: TextStyle(color: Colors.green, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: responsiveHeight(context, 25),
                    width: responsiveWidth(context, 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green,
                      ),
                      padding: EdgeInsets.all(0),
                      child: Icon(Icons.add, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedList() {
    List<Map<String, dynamic>> recommendedItems = [
      {
        "image": "assets/11.png",
        "title": "Spicy Burger",
        "description": "A delicious spicy burger with fresh ingredients",
        "price": 103,
        "float":".0",
        "numline": "70.5",


      },
      {
        "image": "assets/22.png",
        "title": "Veggie Pizza",
        "description": "Healthy and tasty veggie pizza with cheese",
        "price": 50,
        "float": ".0",
        "numline": "40.5",
      },
      {
        "image": "assets/33.png",
        "title": "Grilled Chicken",
        "description": "Juicy grilled chicken with fresh herbs",
        "price": 12,
        "float": ".99",
        "numline": "6.5",
      },
      {
        "image": "assets/44.png",
        "title": "Chocolate Cake",
        "description": "Sweet and rich chocolate cake for dessert",
        "price": 8,
        "float": ".20",
        "numline": "4.5",
      },
    ];

    return SizedBox(
      height: responsiveHeight(context, 120),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendedItems.length,

        itemBuilder: (context, index) {
          return _buildSmallFoodCard(
            recommendedItems[index]["image"],
            recommendedItems[index]["title"],
            recommendedItems[index]["description"],
            recommendedItems[index]["price"],
            recommendedItems[index]["float"],
            recommendedItems[index]["numline"],
          );
        },
      ),
    );
  }

  Widget _buildSmallFoodCard(
    String imagePath,
    String title,
    String description,
    num price,
    String float,
  String numline,
  ) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => Home2Product(title: title, description: description, image: imagePath, price: price, float: float,numline: numline));
      },
      child: Container(
        width: responsiveWidth(context, 90),
        height: responsiveHeight(context, 120),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(19),
          child: Image.asset(
            imagePath,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
