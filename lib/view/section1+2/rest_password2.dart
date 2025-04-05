import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helper/responsive.dart';
import '../../widgets/custom_button_widget.dart';
import 'login_screen.dart';


class RestPassword2 extends StatefulWidget {
  const RestPassword2({super.key});

  @override
  State<RestPassword2> createState() => _RestPassword2State();
}

class _RestPassword2State extends State<RestPassword2> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Stack(
            children: [
              SvgPicture.asset('assets/Pattern.svg', fit: BoxFit.cover),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(context, 24),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: responsiveHeight(context, 74)),
                      Image.asset(
                        'assets/logo.png',
                        width: responsiveWidth(context, 307),
                        height: responsiveHeight(context, 85),
                      ),
                      SizedBox(height: responsiveHeight(context, 46)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context, 24),
                          vertical: responsiveHeight(context, 24),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: responsiveWidth(context, 343),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.keyboard_backspace_sharp,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: responsiveHeight(context, 24)),
                              Text(
                                "Rest Password",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: responsiveHeight(context, 12)),
                              Row(
                                children: [
                                  Text(
                                    "Want to try with my current password? ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(width: responsiveWidth(context, 4)),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: responsiveHeight(context, 24)),
                              Text(
                                "New Password",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: responsiveHeight(context, 3)),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 14),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: responsiveHeight(context, 12),
                                    horizontal: responsiveWidth(context, 10),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorStyle: TextStyle(height: 0),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  if (value.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: responsiveHeight(context, 16)),
                              Text(
                                "Confirm New Password",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: responsiveHeight(context, 3)),
                              TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(

                                  hintStyle: TextStyle(fontSize: 14),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: responsiveHeight(context, 12),
                                    horizontal: responsiveWidth(context, 10),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorStyle: TextStyle(
                                    height: responsiveHeight(context, 0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  }
                                  if (value != _passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: responsiveHeight(context, 24)),
                              CustomButton(onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    barrierColor: Colors.black.withOpacity(
                                      0.6,
                                    ),
                                    barrierDismissible: true,
                                    builder:
                                        (context) => Stack(
                                      children: [
                                        BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 5,
                                            sigmaY: 5,
                                          ),
                                          child: Container(
                                            color: Colors.black
                                                .withOpacity(0.3),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                    LoginScreen(),
                                              ),
                                            );
                                          },
                                          child: Center(
                                            child: Dialog(
                                              backgroundColor:
                                              Colors.transparent,
                                              child: Column(
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    'assets/successUpdate.png',
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    "Congratulations!",
                                                    style: TextStyle(
                                                      color:
                                                      Colors.white,
                                                      fontSize: 24,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    "Password reset successfully",
                                                    style: TextStyle(
                                                      color:
                                                      Colors
                                                          .white70,
                                                      fontSize: 16,
                                                    ),
                                                    textAlign:
                                                    TextAlign
                                                        .center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                                  backgroundColor: Color(0xFF25AE4B),
                                  height: 48,
                                  title: "Update Password")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
