import 'package:flutter/material.dart';

import '../helper/responsive.dart';
import 'custom_button_widget.dart';


class RemoveFavoriteDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  RemoveFavoriteDialog({required this.onConfirm, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Material(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: responsiveWidth(context, 330),
              height: responsiveHeight(context, 165),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Are you sure you want to remove it from favorites?",
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  CustomButton(
                    onPress: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Color(0xFF25AE4B),
                    height: responsiveHeight(context, 45),
                    width: responsiveWidth(context, 250),
                    title: "Yes",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
