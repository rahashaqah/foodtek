import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../helper/function/validation_functions.dart';
import '../../helper/responsive.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/date_input_widget.dart';
import '../../widgets/input_widgets.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? selectedDate;
  String countryFlag = '🇺🇸';
  String countryCode = '+1';
  bool isValid = false;
  String searchQuery = "";
  bool showError = false;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('SignUp Successful')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields correctly')),
      );
    }
  }

  String getFlagEmoji(String countryCode) {
    final int flagOffset = 0x1F1E6;
    final int asciiOffset = 0x41;
    final String firstChar = countryCode[0];
    final String secondChar = countryCode[1];
    final int firstEmoji = flagOffset + firstChar.codeUnitAt(0) - asciiOffset;
    final int secondEmoji = flagOffset + secondChar.codeUnitAt(0) - asciiOffset;
    return String.fromCharCode(firstEmoji) + String.fromCharCode(secondEmoji);
  }

  void showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Search country",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setModalState(() => searchQuery = value);
                    },
                  ),
                  Expanded(
                    child: ListView(
                      children:
                          codes
                              .where(
                                (country) => country['name']!
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()),
                              )
                              .map((country) {
                                return ListTile(
                                  leading: Text(getFlagEmoji(country['code']!)),
                                  title: Text(country['name']!),
                                  trailing: Text(country['dial_code']!),
                                  onTap: () {
                                    setState(() {
                                      countryFlag = getFlagEmoji(
                                        country['code']!,
                                      );
                                      countryCode = country['dial_code']!;
                                    });
                                    Navigator.pop(context);
                                  },
                                );
                              })
                              .toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          SvgPicture.asset('assets/Pattern.svg'),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 80,
                  left: 30,
                  right: 30,
                  bottom: 100,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: responsiveHeight(context, 85),
                        width: responsiveWidth(context, 307),
                      ),
                      SizedBox(height: responsiveHeight(context, 20)),

                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () => Navigator.pop(context),
                              ),
                              Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Already have an account?"),
                                  TextButton(
                                    onPressed: () {
                                      },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Full Name",
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              InputWidget(
                                textEditingController: fullNameController,
                                isPassword: false,
                                validator: validateName,
                              ),
                              SizedBox(height: responsiveHeight(context, 10)), ////////////
                              Text(
                                "Email",
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              InputWidget(
                                textEditingController: emailController,
                                isPassword: false,
                                keyboardType: TextInputType.emailAddress,
                                validator: validateEmail,
                              ),
                              SizedBox(height: responsiveHeight(context, 10)), /////////////////
                              Text(
                                "Barth Of Data",
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              DateInputWidget(
                                controller: dateController,
                                suffixIcon: Icon(Icons.calendar_today_outlined),
                                validator: validateDOB,
                              ),
                              SizedBox(height: responsiveHeight(context, 10)), /////////////////
                              Text(
                                "Phone Number",
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              buildPhoneNumberField(validator: validatePhone),
                              SizedBox(height: responsiveHeight(context, 10)), /////////////////
                              Text(
                                "Set Password",
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              InputWidget(
                                textEditingController: passwordController,
                                isPassword: true,
                                validator: validatePassword,
                              ),
                              SizedBox(height: responsiveHeight(context, 15)), /////////////////
                              CustomButton(
                                onPress: () {
                                  _submitForm();
                                },
                                backgroundColor: Color(0xFF25AE4B),
                                height: responsiveHeight(context, 48),
                                title: "Register",
                              ),
                            ],
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
    );
  }

  Widget buildPhoneNumberField({
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:
                  (showError && validatePhone(phoneController.text) != null)
                      ? Color(0xFFB71C1C)
                      : Colors.grey,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () => showCountryPicker(context),
                  child: Row(
                    children: [
                      Text(countryFlag, style: TextStyle(fontSize: 20)),
                      Icon(Icons.arrow_drop_down, color: Colors.grey),
                      SizedBox(width: 8),
                      Text("($countryCode)"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(border: InputBorder.none),
                 validator: validator,
                ),
              ),
            ],
          ),
        ),
        if (showError && validator!(phoneController.text) != null)
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              validator(phoneController.text)!,
              style: TextStyle(color: Color(0xFFB71C1C), fontSize: 14),
            ),
          ),
      ],
    );
  }
}
