import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_day_worker/core/routes/route_names.dart';
import 'package:one_day_worker/shared/components/label.dart';
import 'package:one_day_worker/shared/components/primary_button.dart';

import '../../../core/theme/app_color.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  ValueNotifier<bool> _obscureConfirmPassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Your  ",
                        style: GoogleFonts.inter(
                          color: AppColors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: "Work\n",
                        style: GoogleFonts.inter(
                          color: Theme.of(context).primaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: "            Our",
                        style: GoogleFonts.inter(
                          color: Theme.of(context).primaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: "  Experts",
                        style: GoogleFonts.inter(
                          color: AppColors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Let’s make your work easier",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),

              Text(
                "Quick signup to book skilled workers hassle-free.",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Label("Full Name"),
              TextFormField(controller: _nameController),
              const SizedBox(height: 16),
              Label("Mobile"),
              TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              Label("Password"),
              ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: value,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          value ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Label("Confirm Password"),

              ValueListenableBuilder(
                valueListenable: _obscureConfirmPassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: value,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          value ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          _obscureConfirmPassword.value =
                              !_obscureConfirmPassword.value;
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              Align(
                alignment: Alignment.centerRight,
                child: PrimaryButton(
                  width: 140,
                  onPressed: _onTapSignUp,
                  text: "Sign Up",
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Already have an account ? ",
                style: GoogleFonts.inter(color: Colors.grey.shade800),
              ),
              TextSpan(
                text: "Sign In",
                recognizer: TapGestureRecognizer()..onTap = _onTapSignIn,
                style: GoogleFonts.inter(
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignUp() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Sign Up Successful")));
    }
  }

  void _onTapSignIn() {
    Navigator.pushNamed(context, RouteNames.signInPage);
  }
}
