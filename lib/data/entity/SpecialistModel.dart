import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class SpecialListModel {
  final String title;
  final IconData imgUrl;
  final Color color;

  SpecialListModel({
    required this.title,
    required this.imgUrl,
    required this.color,
  });

  static List<SpecialListModel> list = [
    SpecialListModel(
      title: "All",
      imgUrl: SolarIconsOutline.inbox,
      color: const Color(0xFF4167E1),
    ),
    SpecialListModel(
      title: "Cardiologist",
      imgUrl: SolarIconsOutline.heartPulse,
      color: const Color(0xFF4167E1),
    ),
    SpecialListModel(
      title: "Dermatologist",
      imgUrl: SolarIconsOutline.health,
      color: const Color(0xEFF19808),
    ),
    SpecialListModel(
      title: "Neurologist",
      imgUrl: SolarIconsOutline.headphonesRound,
      color: const Color(0xFFC25257),
    ),
    SpecialListModel(
      title: "Orthopedic",
      imgUrl: SolarIconsOutline.boneCrack,
      color: const Color(0xFF5A79DB),
    ),
    SpecialListModel(
      title: "Pediatrician",
      imgUrl: SolarIconsOutline.gameboy,
      color: const Color(0xFF754FE1),
    ),
    SpecialListModel(
      title: "Gynecologist",
      imgUrl: SolarIconsOutline.heartPulse,
      color: const Color(0xFFD81B60),
    ),
    SpecialListModel(
      title: "ENT Specialist",
      imgUrl: Icons.hearing,
      color: const Color(0xEFF10833),
    ),
    SpecialListModel(
      title: "General Physician",
      imgUrl: SolarIconsOutline.stethoscope,
      color: const Color(0xFF6D4C41),
    ),
  ];
}
