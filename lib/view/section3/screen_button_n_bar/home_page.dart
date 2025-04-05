import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/filter_cubit.dart';
import '../../../helper/responsive.dart';
import '../../../state/filter_state.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/remove_favorite_dialog.dart';
import '../tap_widgets/all_tap_widgets.dart';
import '../tap_widgets/burger_tap_widgets.dart';
import '../tap_widgets/pizza_tap_widgets.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterButton(context, 'All'),
                    _buildFilterButton(context, 'Burger', emoji: '🍔'),
                    _buildFilterButton(context, 'Pizza',  emoji: '🍕'),
                    _buildFilterButton(context, 'Sandwich', emoji: '🌭'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              BlocBuilder<FilterCubit , FilterState>(
                builder: (context, state) {
                  return _buildContentBasedOnFilter(state);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context, String filter, {String? emoji}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: BlocBuilder<FilterCubit, FilterState>(
        builder: (context, state) {
          final isSelected = (state is FilterUpdated && state.filter == filter) ||
              (state is FilterInitial && state.filter == filter);
          return ElevatedButton(
            onPressed: () => context.read<FilterCubit>().setFilter(filter),
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Colors.green : Colors.white,
              foregroundColor: isSelected ? Colors.white : Colors.black,

              side: BorderSide(color: Colors.green[100]!,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (emoji != null) Text(emoji, style: TextStyle(fontSize: 18)),
                SizedBox(width: emoji != null ? 4 : 0),
                Text(filter, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
              ],
            ),
          );
        },
      ),
    );
  }



  Widget _buildContentBasedOnFilter(FilterState state) {
    final filter = state is FilterUpdated ? state.filter : 'All';
    switch (filter) {
      case 'All':
        return AllTapWidget();
      case 'Burger':
        return BurgerTapWidgets();
      case 'Pizza':
        return PizzaTapWidgets();
      case 'Sandwich':
        return _SandwichWidget();
      default:
        return SizedBox();
    }
  }
}



class _SandwichWidget extends StatefulWidget {
  @override
  _SandwichTapWidgetsState createState() => _SandwichTapWidgetsState();
}

class _SandwichTapWidgetsState extends State<_SandwichWidget> {
  List<String> favoriteSandwiches = [];

  final List<Map<String, String>> sandwiches = [
    {
      "image": "assets/san2.jpeg",
      "name": "Chicken Sandwich",
      "description": "Grilled chicken with fresh veggies in a soft bun",
      "price": "\$15",
    },
    {
      "image": "assets/san1.jpeg",
      "name": "Veggie Sandwich",
      "description": "A variety of fresh vegetables in a whole wheat bread",
      "price": "\$12",
    },
    {
      "image": "assets/san1.jpeg",
      "name": "Cheese Sandwich",
      "description": "Cheddar cheese with lettuce and tomatoes in a toasted bun",
      "price": "\$10",
    },
    {
      "image": "assets/san2.jpeg",
      "name": "Beef Sandwich",
      "description": "Tender beef with onions and sauces in a hearty sandwich",
      "price": "\$18",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 100, top: 35),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            mainAxisExtent: 260,
          ),
          itemCount: sandwiches.length,
          itemBuilder: (context, index) {
            return SandwichCard(
              imagePath: sandwiches[index]["image"]!,
              sandwichName: sandwiches[index]["name"]!,
              description: sandwiches[index]["description"]!,
              isFavorite: favoriteSandwiches.contains(sandwiches[index]["name"]!),
              price: sandwiches[index]["price"]!,
              onFavoriteToggle: (name, isFavorite) {
                setState(() {
                  isFavorite
                      ? favoriteSandwiches.add(name)
                      : favoriteSandwiches.remove(name);
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class SandwichCard extends StatefulWidget {
  final String imagePath;
  final String sandwichName;
  final String description;
  final bool isFavorite;
  final Function(String, bool) onFavoriteToggle;
  final String price;

  const SandwichCard({
    Key? key,
    required this.imagePath,
    required this.sandwichName,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.price,
  }) : super(key: key);

  @override
  _SandwichCardState createState() => _SandwichCardState();
}

class _SandwichCardState extends State<SandwichCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: responsiveHeight(context, 250),
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.grey[300]!),
            ),
            color: Colors.white,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 45, horizontal: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.sandwichName,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  SizedBox(height: responsiveHeight(context, 10)),

                  Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.flash_on,
                              color: Colors.orange,
                              size: 13,
                            ),
                          ),

                          Flexible(
                            child: Text(
                              widget.description,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                  letterSpacing: -0.1
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      )

                  ),


                ],
              ),
            ),
          ),
        ),
        Positioned(bottom: 80, left: 60,
          child: Text(widget.price,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
        ),

        Positioned(
          top: -40,
          left: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              color: Colors.grey[300],
              height: responsiveHeight(context, 98),
              width: responsiveWidth(context, 98),
              child: Image.asset(
                widget.imagePath,
                height: responsiveHeight(context, 70),
                width: responsiveWidth(context, 70),
fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: -4,
          left: 130,
          bottom: 235,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color:  Colors.green[100],
              height: responsiveHeight(context, 30),
              width: responsiveWidth(context, 28),
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  if (isFavorite) {

                    showDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.5),
                      builder: (context) {
                        return Stack( children: [
                          BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(color: Colors.black.withOpacity(0.2)),

                          ),

                          RemoveFavoriteDialog(
                            onConfirm: () {
                              setState(() {
                                isFavorite = false;
                                widget.onFavoriteToggle(widget.sandwichName, isFavorite);
                              });
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              Navigator.pop(context);
                            },
                          ),]
                        );
                      },
                    );
                  } else {
                    setState(() {
                      isFavorite = true;
                      widget.onFavoriteToggle(widget.sandwichName, isFavorite);
                    });
                  }
                },

              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 30,
          child: CustomButton(
            onPress: () {},
            backgroundColor:  Color(0xFF25AE4B),
            height: responsiveHeight(context, 35),
            width: responsiveWidth(context, 110),
            title: "Order Now",
            borderRadius: 25,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
