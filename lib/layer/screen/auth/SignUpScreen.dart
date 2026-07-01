import 'package:flutter/material.dart';
import 'package:greenlife/core/router/AppRoute.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../widget/CustomText.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration Successful")),
      );

      context.pushReplace(AppRoute.dashboard);
    }
  }

  double vSpace(double h, Size size) => size.height * (h / 812);
  double hSpace(double w, Size size) => size.width * (w / 375);

  Widget buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    Widget? suffixIcon,
    int? maxLength,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      maxLength: maxLength,
      cursorWidth: 2,
      cursorHeight: 18,
      cursorColor: Colors.black,
      showCursor: true,
      validator: validator,
      decoration: InputDecoration(
        counterText: "",
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.green),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF4FAF7),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.symmetric(
                  horizontal: hSpace(20, size),
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

                        SizedBox(height: vSpace(10, size)),

                        const CustomText(
                          title: "Create Account",
                          size: 28,
                          weight: FontWeight.bold,
                          textColor: Colors.black,
                        ),

                        SizedBox(height: vSpace(8, size)),

                        const CustomText(
                          title:
                          "Sign up to continue your health care journey",
                          size: 16,
                          textAlign: TextAlign.center,
                          textColor: Colors.grey,
                        ),

                        SizedBox(height: vSpace(30, size)),

                        buildField(
                          controller: name,
                          hint: "Full Name",
                          icon: Icons.person_outline,
                          validator: (v) =>
                          v == null || v.isEmpty ? "Enter name" : null,
                        ),

                        SizedBox(height: vSpace(15, size)),

                        buildField(
                          controller: phone,
                          hint: "Phone Number",
                          icon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return "Enter phone number";
                            }
                            if (!RegExp(r'^[0-9]{10}$').hasMatch(v)) {
                              return "Enter valid 10-digit number";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: vSpace(15, size)),

                        buildField(
                          controller: email,
                          hint: "Email Address",
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            if (v == null || v.isEmpty) return "Enter email";
                            if (!RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(v)) {
                              return "Invalid email";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: vSpace(15, size)),

                        buildField(
                          controller: password,
                          hint: "Password",
                          icon: Icons.lock_outline,
                          obscure: hidePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return "Enter password";
                            }
                            if (v.length < 6) {
                              return "Minimum 6 characters";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: vSpace(15, size)),

                        buildField(
                          controller: confirmPassword,
                          hint: "Confirm Password",
                          icon: Icons.lock_outline,
                          obscure: hideConfirmPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              hideConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                hideConfirmPassword =
                                !hideConfirmPassword;
                              });
                            },
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return "Confirm password";
                            }
                            if (v != password.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: vSpace(25, size)),

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
                            onPressed: register,
                            child: const CustomText(
                              title: "REGISTER",
                              size: 18,
                              weight: FontWeight.bold,
                              textColor: Colors.white,
                            ),
                          ),
                        ),

                        SizedBox(height: vSpace(20, size)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomText(
                              title: "Already have an account? ",
                              size: 14,
                            ),
                            TextButton(
                              onPressed: () {
                                context.pushReplace(AppRoute.signIn);
                              },
                              child: const CustomText(
                                title: "Sign In",
                                size: 14,
                                weight: FontWeight.bold,
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
}