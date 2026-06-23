import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class CategoryModel {
  final String title;
  final IconData imgUrl;
  final Color color;
  CategoryModel({
    required this.title,
    required this.imgUrl,
    required this.color,
  });

  static List<CategoryModel> list = [
    CategoryModel(
      title: "Appointment",
      imgUrl: SolarIconsOutline.calendar,
      color:  Colors.green, // faded green
    ),
    CategoryModel(
      title: "Find Doctors",
      imgUrl: SolarIconsOutline.hospital,
      color: Colors.orange, // faded brown-orange
    ),
    CategoryModel(
      title: "Reports",
      imgUrl: SolarIconsOutline.bookmarkSquare,
      color: Colors.purple, // faded purple
    ),
    CategoryModel(
      title: "Medicines",
      imgUrl: SolarIconsOutline.medicalKit,
      color: Colors.indigo,
    ),
    CategoryModel(
      title: "Insurance",
      imgUrl: SolarIconsOutline.shieldPlus,
      color: Colors.pink
    ),
    CategoryModel(
      title: "Emergency",
      imgUrl: SolarIconsOutline.callMedicineRounded,
      color: Colors.amber,
    ),
    CategoryModel(
      title: "Health Records",
      imgUrl: SolarIconsOutline.checklist,
      color: Colors.brown,
    ),

  ];

}
