import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../helper/responsive.dart';
import '../../../widgets/custom_floating_button.dart';
import '../../../widgets/custom_navigation_bar.dart';
import '../../../widgets/notifications_bottomsheet.dart';
import '../screen_button_n_bar/cart_shaping_page.dart';
import '../screen_button_n_bar/favorite_page.dart';
import '../screen_button_n_bar/history_page.dart';
import '../screen_button_n_bar/person_page.dart';
import 'details_page.dart';
import 'home_filter.dart';

class Home2Product extends StatefulWidget {
  final String title;

  final String description;
  final String image;
  final num price;
  final String float ;
  final String numline ;

  const Home2Product({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
   required this.float,
    required this.numline,

  });

  @override
  _Home2ProductState createState() => _Home2ProductState();
}

class _Home2ProductState extends State<Home2Product> {
  TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = [];

  @override
  void initState() {
    _pages = [
      DetailsPage(
        title: widget.title,
        description: widget.description,
        image: widget.image,
        price: widget.price.toInt(),
        float: widget.float,
        numline: widget.numline,

      ),
      FavoritePage(),
      CartShapingPage(),
      HistoryPage(),
      PersonPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  suffixIcon:IconButton(
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
