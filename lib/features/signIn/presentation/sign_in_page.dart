import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_day_worker/shared/components/label.dart';
import 'package:one_day_worker/shared/components/primary_button.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_color.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

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
              const SizedBox(height: 100),
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
                "Hi! Welcome back, you've been missed",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.grey.shade800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Label("Mobile"),
              TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              Label("Password"),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerRight,
                child: Text("Forget Password?", style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationColor:AppColors.red,
                  color:AppColors.red,
                )),
              ),
              const SizedBox(height: 24),

              Align(
                alignment: Alignment.center,
                child: PrimaryButton(
                  width: 140,
                  onPressed: _onTapSignIn,
                  text: "Log In",
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
                text: "Don't Have any account ? ",
                style: GoogleFonts.inter(color: Colors.grey.shade800),
              ),
              TextSpan(
                text: "Sign Up",
                recognizer: TapGestureRecognizer()..onTap = _onTapSignUp,
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

  void _onTapSignIn() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Sign Up Successful")));
      Navigator.pushNamed(context, RouteNames.dashboard);

    }
  }

  void _onTapSignUp() {}
}
