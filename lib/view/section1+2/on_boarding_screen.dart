import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../helper/function/enable_gbs.dart';
import '../../helper/responsive.dart';
import '../../localization/change_local.dart';
import 'login_screen.dart';

void main() {
  runApp(MaterialApp(home: OnboardingScreen()));
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'middle': 'assets/Order1.svg',
      'title': 'Welcome To Sahlah',
      'description': 'Enjoy At Fast and Smooth Food Delivery \nAt Your Doorstep',
    },
    {
      'middle': 'assets/Order2.svg',
      'title': 'Get Delivery On Time',
      'description':
      'Order Your Favorite Food Within The \n Palm Of Your Hand And the Zone \nOf Your Comfort',
    },
    {
      'middle': 'assets/Order2.svg',
      'title': 'Choose Your Food',
      'description':
      'Order Your Favorite Food Within The \n Palm Of Your Hand And the Zone \nOf Your Comfort',
    },
  ];

  void _goToEnableGpsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EnableGpsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/Pattern.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SvgImageWithShadowAndBlur(),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: SvgPicture.asset(
              'assets/Rectangle2.svg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),




          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              ...onboardingData.map((data) {
                return _buildOnboardingPage(data);
              }).toList(),
            ],
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: IconButton(
                icon: Icon(
                  Icons.language,
                  size: 30,
                ),
                onPressed: () {
                  if (Get.locale == Locale('ar', 'AE')) {
                    Get.updateLocale(Locale('en', 'US'));
                  } else {
                    Get.updateLocale(Locale('ar', 'AE'));
                  }
                },
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            left: 20,
            child: TextButton(
              onPressed: _goToEnableGpsScreen,
              child: Text(
                "Skip".tr,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          if(_currentIndex!=2)Positioned(
            bottom: 50,
            right: 20,
            child: IconButton(
              onPressed: () {
                if (_currentIndex < onboardingData.length - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              icon: Icon(Icons.arrow_forward, size: 24, color: Colors.green),
            ),
          ),
          Positioned(
            bottom: 65,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                    (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: responsiveWidth(context, 8),
                  height: responsiveHeight(context, 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.green : Colors.grey,
                  ),

                ),

              ),

            ),

          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(Map<String, String> data) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            data['middle']!,
            height: responsiveHeight(context, 280),
          ),
          SizedBox(height: responsiveHeight(context, 20)),
          Text(
            data['title']!.tr  ,
            style: TextStyle(
              fontSize: 32,
              color: Color(0xFF455A64),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: responsiveHeight(context, 5)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 40),
            ),
            child: SizedBox(
              width: responsiveWidth(context, 340),

              child: Text(
                data['description']!.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF455A64),
                  letterSpacing: 0.24,
                ),
              ),
            ),
          ),
          SizedBox(height: responsiveHeight(context, 70)),

          ElevatedButton(
            onPressed: () {
              if (_currentIndex < onboardingData.length - 1) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                _goToEnableGpsScreen();
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Container(
              width: responsiveWidth(context, 307),
              height: responsiveHeight(context, 48),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF25AE4B), Color(0xFF0F481F)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(69),
              ),
              child: Center(
                child: Text(
                  _currentIndex < onboardingData.length - 1
                      ? "Continue".tr
                      : "Continue".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EnableGpsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/maps.png',),
          SvgImageWithShadowAndBlur(),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: SvgPicture.asset(
              'assets/Rectangle2.svg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Order2.svg',
                  width: responsiveHeight(context, 328.5),
                  height: responsiveHeight(context, 219),
                ),
                SizedBox(height: responsiveHeight(context, 20)),
                Text(
                  'Turn On Your Location',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey[700],
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 10)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'To Continues, Let Your Device Turn On Location, Which Uses Google’s Location Service',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 50)),
                ElevatedButton(
                  onPressed: () {
                   enableGPS();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Container(
                    width: responsiveWidth(context, 307),
                    height: responsiveHeight(context, 48),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF25AE4B), Color(0xFF0F481F)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "Yes, Turn it On",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 5)),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Container(
                    width: responsiveWidth(context, 307),
                    height: responsiveHeight(context, 48),
                    decoration: BoxDecoration(
                      color: Color(0xFFC2C2C2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Color(0xFF455A64),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SvgImageWithShadowAndBlur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 250),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.white, blurRadius: 67.7)],
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: SvgPicture.asset('assets/Rectangle1.svg', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}


