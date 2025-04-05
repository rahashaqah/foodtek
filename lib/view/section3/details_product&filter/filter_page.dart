import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/responsive.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18,top: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: responsiveHeight(context, 10),),

                Text("Price range".tr, style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(5),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text("Min".tr, style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text("Max".tr, style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 10)),
                StatefulBuilder(
                  builder: (context, setState) {
                    RangeValues rangeValues = RangeValues(0, 10000000000); //


                    String formatNumber(double number) {
                      if (number >= 1000000000) {
                        return "\$${(number ~/ 1000000000)}B"; //
                      } else if (number >= 1000000) {
                        return "\$${(number ~/ 1000000)}M"; //
                      } else if (number >= 1000) {
                        return "\$${(number ~/ 1000)}K"; //
                      } else if (number > 0) {
                        return "\$${number.toInt()}";
                      } else {
                        return "\$0";
                      }
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5), //
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatNumber(rangeValues.start), //
                                style: TextStyle(fontSize: 12,color: Colors.green,fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: Text(
                                  formatNumber(rangeValues.end), //
                                  style: TextStyle(fontSize: 12,color: Colors.green, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        RangeSlider(
                          values: rangeValues,
                          min: 0,
                          max: 10000000000,
                          divisions: 100,
                          labels: RangeLabels(
                            formatNumber(rangeValues.start),
                            formatNumber(rangeValues.end),
                          ),
                          onChanged: (newValues) {
                            setState(() {
                              rangeValues = newValues;
                            });
                          },
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey[300],
                        ),
                      ],
                    );
                  },
                ),
                Text("Discount".tr, style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text("Min".tr, style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text("Max".tr, style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 10)),
                StatefulBuilder(
                  builder: (context, setState) {
                    double sliderValue = 50;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$0",
                                style: TextStyle(fontSize: 12,color: Colors.green, fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.only(right: 13),
                              child: Text("${(100 - sliderValue.toInt())}%",
                                  style: TextStyle(fontSize: 12,color: Colors.green, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Slider(
                          value: sliderValue,
                          min: 0,
                          max: 100,
                          divisions: 100,
                          label: "${sliderValue.toInt()}%",
                          onChanged: (newValue) {
                            setState(() {
                              sliderValue = newValue;
                            });
                          },
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey[300],
                        ),
                      ],
                    );
                  },
                ),

                Text("Category".tr, style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.bold)),
                SizedBox(height: responsiveHeight(context, 10)),
                Row(
                  children: ["Fast Food".tr, "Sea Food".tr, "Dessert".tr].map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(category, style: TextStyle(color: category ==  "Sea Food" ? Colors.white : Colors.black),),
                        selected: category == "Sea Food",
                        onSelected: (selected) {},
                        selectedColor: Colors.green,
                        backgroundColor: Colors.grey[200],
                        showCheckmark: false,
                          side: BorderSide.none,
                      ),
                    );
                  }).toList(),
                ),
                Text("Location".tr, style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.bold)),
                SizedBox(height: responsiveHeight(context, 10)),
                Row(
                  children: [1, 5, 10].map((km) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text("$km KM",style: TextStyle(color: km == 5 ? Colors.white : Colors.black),
                      ),
                        selected: km == 5,
                        onSelected: (selected) {},
                        selectedColor: Colors.green,
                        backgroundColor: Colors.grey[200],
                        showCheckmark: false,
                        side: BorderSide.none,

                      ),
                    );
                  }).toList(),
                ),
                Text("Dish", style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.bold)),
                SizedBox(height: responsiveHeight(context, 10)),
                Wrap(
                  spacing: 8.0,
                  children: [
                    "Tuna Tartare".tr,
                    "Spicy Crab Cakes".tr,
                    "Seafood Paella".tr,
                    "Clam Chowder".tr,
                    "Miso-Glazed Cod".tr,
                    "Lobster Thermidor".tr
                  ].map((dish) {
                    return ChoiceChip(
                      label: Text(dish, style: TextStyle(color: dish == "Spicy Crab Cakes" ? Colors.white : Colors.black),),
                      selected: dish == "Spicy Crab Cakes",
                      onSelected: (selected) {},
                      selectedColor: Colors.green,
                      backgroundColor: Colors.grey[200],
                      showCheckmark: false, //
                      side: BorderSide.none,

                    );
                  }).toList(),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
