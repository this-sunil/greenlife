import 'package:flutter/material.dart';
import 'package:greenlife/core/router/AppRoute.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../widget/CustomText.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  double vSpace(double h, Size size) => size.height * (h / 812);
  double hSpace(double w, Size size) => size.width * (w / 375);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF5F9F8),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.symmetric(
                  horizontal: hSpace(25, size),
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: vSpace(20, size)),

                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withAlpha(3),
                                blurRadius: 25,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: const  Icon(
                            SolarIconsOutline.shieldPlus,

                            size: 70,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: vSpace(25, size)),

                        const CustomText(
                          title: "Welcome Back!",
                          size: 28,
                          weight: FontWeight.bold,
                        ),

                        SizedBox(height: vSpace(10, size)),

                        CustomText(
                          title:
                          "Sign in to continue your health care journey",
                          textAlign: TextAlign.center,
                          textColor: Colors.grey,
                          size: 16,
                        ),

                        SizedBox(height: vSpace(35, size)),

                        _phoneField(),

                        SizedBox(height: vSpace(20, size)),

                        _passwordField(),

                        SizedBox(height: vSpace(10, size)),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child:
                            const CustomText(title: "Forgot Password?"),
                          ),
                        ),

                        SizedBox(height: vSpace(10, size)),

                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: CustomText(
                                      title: "Login Successful",
                                    ),
                                  ),
                                );

                                context.pushReplace(AppRoute.dashboard);
                              }
                            },
                            child: const CustomText(
                              title: "LOGIN",
                              size: 18,
                              textColor: Colors.white,
                            ),
                          ),
                        ),

                        SizedBox(height: vSpace(30, size)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomText(
                              title: "Don't have an account?",
                            ),
                            TextButton(
                              onPressed: () {
                                context.pushReplace(AppRoute.signUp);
                              },
                              child: const CustomText(
                                title: "Sign Up",
                                size: 14,
                                textColor: Colors.green,
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: vSpace(20, size)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _phoneField() {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      cursorWidth: 2,
      cursorHeight: 18,
      cursorColor: Colors.black,
      showCursor: true,
      decoration: InputDecoration(
        hintText: "Phone Number",
        prefixIcon: const Icon(Icons.phone_outlined),
        prefixText: "+91 ",
        counterText: "",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please enter your phone number";
        }
        if (!RegExp(r'^[0-9]{10}$').hasMatch(value.trim())) {
          return "Enter a valid 10-digit phone number";
        }
        return null;
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: obscurePassword,
      cursorWidth: 2,
      cursorHeight: 18,
      cursorColor: Colors.black,
      showCursor: true,
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter password";
        }
        if (value.length < 6) {
          return "Minimum 6 characters";
        }
        return null;
      },
    );
  }
}