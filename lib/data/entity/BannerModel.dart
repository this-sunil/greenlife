

import 'package:flutter/material.dart';

class BannerModel{
  final String title;
  final String subtitle;
  final String imgUrl;
  final String btnTitle;
  final Color btnColor;

  BannerModel({required this.title, required this.subtitle, required this.imgUrl, required this.btnTitle, required this.btnColor});


  static List<BannerModel> bannerModel = [
    BannerModel(
      title: 'Care Made Simple',
      subtitle: 'Your health, simplified',
      imgUrl: 'https://media.istockphoto.com/id/1363588189/photo/healthy-lifestyle-on-ketogenic-diet-eating-clean-keto-food-good-health-dietary-in-heart-dish.jpg?s=612x612&w=0&k=20&c=RVW_a2Bq3eYeUWqkUbTUHkiQbGJaAMa9Q2fyljGymgY=',
      btnTitle: 'Explore',
      btnColor: Colors.green,
    ),

    BannerModel(
      title: 'Build Healthy Habits',
      subtitle: 'Track your daily progress',
      imgUrl: 'https://images.unsplash.com/photo-1505751172876-fa1923c5c528',
      btnTitle: 'Get Started',
      btnColor: Colors.blue,
    ),

    BannerModel(
      title: 'Mental Wellness',
      subtitle: 'Find calm and clarity',
      imgUrl: 'https://images.unsplash.com/photo-1506126613408-eca07ce68773',
      btnTitle: 'Relax',
      btnColor: Colors.purple,
    ),

    BannerModel(
      title: 'Fitness Goals',
      subtitle: 'Push beyond your limits',
      imgUrl: 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438',
      btnTitle: 'Train Now',
      btnColor: Colors.red,
    ),

    BannerModel(
      title: 'Nutritious Living',
      subtitle: 'Eat clean, stay strong',
      imgUrl: 'https://images.unsplash.com/photo-1490645935967-10de6ba17061',
      btnTitle: 'Eat Better',
      btnColor: Colors.orange,
    ),

    BannerModel(
      title: 'Better Sleep',
      subtitle: 'Recover & recharge deeply',
      imgUrl: 'https://images.unsplash.com/photo-1541781774459-bb2af2f05b55',
      btnTitle: 'Sleep Well',
      btnColor: Colors.teal,
    ),
  ];
}