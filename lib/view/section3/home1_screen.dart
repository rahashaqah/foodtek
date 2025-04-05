import 'package:flutter/material.dart';
import 'package:foodtek1/view/section3/screen_button_n_bar/cart_shaping_page.dart';
import 'package:foodtek1/view/section3/screen_button_n_bar/favorite_page.dart';
import 'package:foodtek1/view/section3/screen_button_n_bar/history_page.dart';
import 'package:foodtek1/view/section3/screen_button_n_bar/home_page.dart';
import 'package:foodtek1/view/section3/screen_button_n_bar/person_page.dart';
import 'package:get/get.dart';

import '../../helper/responsive.dart';
import '../../widgets/custom_floating_button.dart';
import '../../widgets/custom_navigation_bar.dart';
import '../../widgets/notifications_bottomsheet.dart';
import 'details_product&filter/home_filter.dart';

class Home1Screen extends StatefulWidget {
  @override
  _Home1ScreenState createState() => _Home1ScreenState();
}

class _Home1ScreenState extends State<Home1Screen> {
  TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    FavoritePage(),
    CartShapingPage(),
    HistoryPage(),
    PersonPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[200],
                      ),
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: responsiveWidth(context, 7)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Current location'.tr,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(width: responsiveWidth(context, 4)),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey[600],
                              size: 14,
                            ),
                          ],
                        ),
                        Text(
                          'Jl. Soekarno Hatta 15A...',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: responsiveHeight(context, 43),
                  width: responsiveWidth(context, 49),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.all(0),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        showNotificationsSheet(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(7),
            child: Container(
              width: responsiveWidth(context, 400),
              height: responsiveHeight(context, 55),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 15,
                    wordSpacing: -1,
                    color: Colors.grey[600],
                  ),
                  hintText: 'Search menu, restaurant or etc'.tr,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Colors.grey[600]),
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(minWidth: 20),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Get.to(() => HomeFilter());
                    },
                    icon: Icon(Icons.tune),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 10),
                ),
              ),
            ),
          ),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          CustomBottomNavigationBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
          Positioned(
            top: -20,
            child: CustomFloatingButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
