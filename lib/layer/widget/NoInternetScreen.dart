import 'package:flutter/material.dart';
import 'package:greenlife/layer/widget/CustomText.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(title: "No Internet !!!!"),
      ),
    );
  }
}
