import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(("Favorites"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
      ),
    );
  }
}
