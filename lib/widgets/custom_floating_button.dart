import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;

  CustomFloatingButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF25AE4B),
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 30),
    );
  }
}