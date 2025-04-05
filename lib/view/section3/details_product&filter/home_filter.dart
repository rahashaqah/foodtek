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
import 'filter_page.dart';

class HomeFilter extends StatefulWidget {

  const HomeFilter({
    super.key,
  });

  @override
  _HomeFilterState createState() => _HomeFilterState();
}

class _HomeFilterState extends State<HomeFilter> {
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
      FilterPage(),
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
