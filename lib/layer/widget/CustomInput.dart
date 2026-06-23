import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final FormFieldValidator? validator;

  const CustomInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: Colors.black,
      cursorHeight: 18,

      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(prefixIcon,color: Colors.black),
        suffixIcon: Icon(suffixIcon,color: Colors.black),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black,fontSize: 12),
        contentPadding: .all(12),
        border: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
