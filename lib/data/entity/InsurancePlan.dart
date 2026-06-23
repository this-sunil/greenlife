import 'package:flutter/material.dart';

class InsurancePlan {
  final String title;
  final String company;
  final String coverage;
  final String price;
  final Color color;
  bool selected;

  InsurancePlan({
    required this.title,
    required this.company,
    required this.coverage,
    required this.price,
    required this.color,
    this.selected = false,
  });
}