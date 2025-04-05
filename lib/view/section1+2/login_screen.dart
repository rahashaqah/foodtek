import 'package:flutter/material.dart'
    show
        Card,
        Checkbox,
        Colors,
        Divider,
        ElevatedButton,
        FloatingLabelBehavior,
        IconButton,
        Icons,
        InputDecoration,
        MaterialPageRoute,
        MaterialTapTargetSize,
        OutlineInputBorder,
        Scaffold,
        TextButton,
        TextField;
import 'package:flutter/widgets.dart';
import 'package:flutter_social_button/flutter_social_button.dart'
    show SocialButton;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek1/view/section1+2/rest_password.dart';
import 'package:foodtek1/view/section1+2/sgin_up_screen.dart';

import '../../helper/responsive.dart';
import '../../helper/secure_storage_helper.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/input_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    bool rememberMe = await SharedPreferencesHelper.instance.getRememberMe();
    setState(() async {
      _rememberMe = rememberMe;
      if (_rememberMe) {
        emailController.text = await SharedPreferencesHelper().getEmail();
        passwordController.text = await SharedPreferencesHelper().getPassword();
      }
    });
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
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: responsiveHeight(context, 10)),

                            Text(
                              "Email",
                              style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500),
                            ),
                            InputWidget(textEditingController:emailController,isPassword: false,
                            ),
                            SizedBox(height: responsiveHeight(context, 20)),
                            Text(
                              "Password",
                              style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500),
                            ),
                            InputWidget(textEditingController: passwordController,isPassword: true,
                            ),

                            SizedBox(height: responsiveHeight(context, 0)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 0.9,
                                      child: Checkbox(
                                        value: _rememberMe,
                                        onChanged: (value) {
                                          setState(() {
                                            _rememberMe = value!;
                                          });
                                        },
                                      ),
                                    ),

                                    Transform.translate(
                                      offset: Offset(-8, 0),
                                      child: Text(
                                        'Remember me',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RestPassword(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: responsiveHeight(context, 10)),
                             
                            CustomButton(onPress:  () async {
                              String username = emailController.text;
                              String password = passwordController.text;


                              if (_rememberMe) {
                                await SharedPreferencesHelper().saveUserData(email: username, password: password);
                              }
                              await SharedPreferencesHelper().saveRememberMe(rememberMe: _rememberMe);


                              print(
                                'Username: $username, Password: $password',
                              );
                              //TODO
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                            },
                                backgroundColor: Color(0xFF25AE4B),
                                height: responsiveHeight(context, 55),
                                title: "Log In",
                                 fontWeight: FontWeight.w800,),

                            SizedBox(height: responsiveHeight(context, 20)),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: responsiveWidth(context, 10),
                                  ),
                                  child: Text(
                                    'Or',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: responsiveHeight(context, 20)),
                            SocialButton(
                              'Continue with Google',
                              'assets/google.png',
                            ),
                            SocialButton(
                              'Continue with Facebook',
                              'assets/facebook.png',
                            ),
                            SocialButton(
                              'Continue with Apple',
                              'assets/apple.png',
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
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final String iconPath;

  SocialButton(this.text, this.iconPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsiveHeight(context, 5)),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          //TODO
        },
        icon: Image.asset(iconPath, width: responsiveWidth(context, 18),
        height: responsiveWidth(context, 18),),
        label: Text(text),
      ),
    );
  }
}
