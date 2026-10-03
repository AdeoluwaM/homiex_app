import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homix/components/homix_custom_botton.dart';
import 'package:homix/components/homix_textfield.dart';
import 'package:homix/gen/assets.gen.dart';
import 'package:homix/pages/sign_in_page.dart';
import 'package:homix/router/app_router.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';
import 'package:h_alert_dialog/h_alert_dialog.dart';



@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> signUp() async {
    // Check if fields are empty first
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      HAlertDialog.showCustomAlertBox(
        context: context,
        timerInSeconds: 5,
        backgroundColor: Colors.redAccent,
        title: 'Error',
        description: 'Please fill in all fields',
        icon: Icons.error,
      );

      return;
    }

    // Check if passwords match
    if (passwordController.text != confirmPasswordController.text) {
      HAlertDialog.showCustomAlertBox(
        context: context,
        timerInSeconds: 5,
        backgroundColor: Colors.redAccent,
        title: 'Error',
        description: 'Passwords do not match',
        icon: Icons.error,
      );

      return;
    }

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      // Close loading dialog
      if (!mounted) return;
      Navigator.pop(context);
      context.pushRoute(HomeRoute());

      // Registration successful
      HAlertDialog.showCustomAlertBox(
        context: context,
        timerInSeconds: 3,
        backgroundColor: Colors.green,
        title: 'Success',
        description: 'Account created successfully!',
        icon: Icons.check_circle,
      );

      context.pushRoute(HomeRoute());
    } on FirebaseAuthException catch (e) {
      // Close loading dialog
      if (!mounted) return;
      Navigator.pop(context);

      String message;

      switch (e.code) {
        case 'email-already-in-use':
          message = 'An account already exists with this email.';
          break;

        case 'invalid-email':
          message = 'Please enter a valid email address.';
          break;

        case 'weak-password':
          message = 'Your password is too weak.';
          break;

        case 'operation-not-allowed':
          message = 'Email/password registration is not enabled in Firebase.';
          break;

        case 'network-request-failed':
          message = 'Please check your internet connection.';
          break;

        default:
          message = 'Registration failed: ${e.code}';
      }

      HAlertDialog.showCustomAlertBox(
        context: context,
        timerInSeconds: 5,
        backgroundColor: Colors.redAccent,
        title: 'Error',
        description: message,
        icon: Icons.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(flex: 1),
                      Image.asset(Assets.images.homixLogo.path,
                          height: 100, fit: BoxFit.contain),
                      SizedBox(
                        height: 10,
                      ),
                      // Welcome Back
                      Text(
                        "Welcome Back",
                        style: AppTextStyle.appTextHeading
                            .copyWith(color: Colors.white),
                      ),
                      // Text again
                      Text(
                        "Let's get you in to Homiex",
                        style: AppTextStyle.appSubHeading
                            .copyWith(color: Color(0x80FFFFFF)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      // Text field
                      HomixTextfield(
                          controller: emailController,
                          obscureText: false,
                          hintText: "Your Email",
                          prefixIcon: Icons.email_outlined),
                      // pw textfield
                      HomixTextfield(
                          controller: passwordController,
                          obscureText: true,
                          hintText: "Your Password",
                          prefixIcon: Icons.lock_outline),
                      HomixTextfield(
                          controller: confirmPasswordController,
                          obscureText: true,
                          hintText: "Confirm Password",
                          prefixIcon: Icons.lock_outline),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      HomixCustomBotton(
                        buttonName: "Sign up",
                        buttonColor: HomixColors.secondaryColor,
                        textColor: HomixColors.whiteColor,
                        onTap: () {
                          signUp();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            const Expanded(
                                child: Divider(
                                    color: HomixColors.tertiaryColor,
                                    thickness: 1)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'or',
                                style: AppTextStyle.appSubHeading
                                    .copyWith(color: HomixColors.whiteColor),
                              ),
                            ),
                            const Expanded(
                                child: Divider(
                                    color: HomixColors.tertiaryColor,
                                    thickness: 1)),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Image.asset(Assets.images.googleLogo.path,
                                height: 40),
                            onTap: () {},
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                              child: Image.asset(Assets.images.appleLogo.path,
                                  height: 40),
                              onTap: () {}),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                              child: Image.asset(
                                  Assets.images.instagramLogo.path,
                                  height: 40),
                              onTap: () {}),
                        ],
                      ),
                      Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an Account? ",
                            style: AppTextStyle.appSubHeading
                                .copyWith(color: HomixColors.whiteColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushRoute(SignInRoute());
                            },
                            child: Text(
                              "Sign In",
                              style: AppTextStyle.appSubHeading
                                  .copyWith(color: HomixColors.secondaryColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
