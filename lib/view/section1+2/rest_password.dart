import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodtek1/view/section1+2/rest_password2.dart';

import '../../helper/responsive.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/input_widgets.dart';
import 'login_screen.dart';

class RestPassword extends StatefulWidget {
  const RestPassword({super.key});

  @override
  _RestPasswordState createState() => _RestPasswordState();
}

class _RestPasswordState extends State<RestPassword> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());


  @override
  void dispose() {
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset('assets/Pattern.svg', fit: BoxFit.cover),
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  SizedBox(height: responsiveHeight(context, 74)),
                  Image.asset(
                    'assets/logo.png',
                    width: responsiveWidth(context, 307),
                    height: responsiveHeight(context, 85),
                  ),
                  SizedBox(height: responsiveHeight(context, 120)),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.keyboard_backspace_sharp),
                              ),
                              Text("Back to ", style: TextStyle(fontSize: 12)),
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
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              Text(" page?", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          SizedBox(height: responsiveHeight(context, 24.3)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Rest Password",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: responsiveHeight(context, 12)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Text(
                                  "Enter your E-mail or phone and we'll send you a link to get back into your account",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: responsiveHeight(context, 24)),
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: responsiveHeight(context, 3)),
                          SizedBox(
                            width: responsiveWidth(context, 295),
                            child: InputWidget(textEditingController:
                              _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(value)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                          ),
                          ),
                          SizedBox(height: responsiveHeight(context, 24)),
                          CustomButton(onPress: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                barrierColor: Colors.black.withOpacity(0.6),
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
                                        color: Colors.black.withOpacity(
                                          0.3,
                                        ),
                                      ),
                                    ),

                                    Center(
                                      child: Dialog(
                                        backgroundColor:
                                        Colors.transparent,
                                        child: Column(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: responsiveWidth(
                                                context,
                                                343,
                                              ),
                                              height: responsiveHeight(
                                                context,
                                                450,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 28),
                                                child: Card(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                      20,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets.all(
                                                      20,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Center(
                                                          child: SvgPicture.asset(
                                                            'assets/SentMessage.svg',
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                          responsiveHeight(
                                                            context,
                                                            10,
                                                          ),
                                                        ),
                                                        Text(
                                                          "A 4-digit code has been sent to your email. Please enter it to verify.",
                                                          style: TextStyle(
                                                              color: Colors.grey[600],fontSize: 11),
                                                          textAlign: TextAlign.center,

                                                        ),
                                                        SizedBox(
                                                          height:
                                                          responsiveHeight(
                                                            context,
                                                            24,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                          children:
                                                          List.generate(
                                                            4,
                                                                (index) {
                                                              return _buildTextField1(
                                                                index,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                          responsiveHeight(
                                                            context,
                                                            24,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                          responsiveHeight(
                                                            context,
                                                            295,
                                                          ),
                                                          height:
                                                          responsiveHeight(
                                                            context,
                                                            48,
                                                          ),
                                                          child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                              Color(
                                                                0xFF25AE4B,
                                                              ),
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                  10,
                                                                ),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (
                                                                      context,
                                                                      ) =>
                                                                      RestPassword2(),
                                                                ),
                                                              );
                                                            },
                                                            child: Text(
                                                              "Verify",
                                                              style: TextStyle(
                                                                fontSize:
                                                                14,
                                                                color:
                                                                Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                              backgroundColor: Color(0xFF25AE4B),
                              height: 48, title: "Send")
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
    );
  }
  Widget _buildTextField1(int index) {
    return SizedBox(
      width: responsiveWidth(context, 50),
      height: responsiveHeight(context, 46),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          }

          if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
      ),
    );
  }
}


