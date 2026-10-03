import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:h_alert_dialog/h_alert_dialog.dart';
import 'package:homix/components/homix_custom_botton.dart';
import 'package:homix/components/homix_textfield.dart';
import 'package:homix/gen/assets.gen.dart';
import 'package:homix/router/app_router.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // void signIn() async {
  // if (emailController.text.trim().isEmpty ||
  //       passwordController.text.isEmpty) {
  //     HAlertDialog.showCustomAlertBox(
  //     context: context,
  //     timerInSeconds: 3,
  //     backgroundColor: Colors.redAccent,
  //     title: 'Error',
  //     description: "Please fill in all fields",
  //     icon: Icons.error_outline,
  //   );
  //     return;
  //   }
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       });
  //       // Navigator.pop(context);
        
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);

  //         if (!mounted) return;

  //         Navigator.pop(context);

  //         context.pushRoute(HomeRoute());

  //   } on FirebaseAuthException catch (e) {
  //     Navigator.pop(context);
  //     HAlertDialog.showCustomAlertBox(
  //       context: context,
  //       timerInSeconds: 3,
  //       backgroundColor: Colors.redAccent,
  //       title: 'Error',
  //       description: e.message.toString(),
  //       icon: Icons.error_outline,
  //     );
  //     // print(e);
  //   }
  //   return;
  // }


  void signIn() async {
  // Local validation first
  if (emailController.text.trim().isEmpty ||
      passwordController.text.isEmpty) {
    HAlertDialog.showCustomAlertBox(
      context: context,
      timerInSeconds: 3,
      backgroundColor: Colors.redAccent,
      title: 'Error',
      description: "Please fill in all fields",
      icon: Icons.error_outline,
    );
    return;
  }

  // Show loading dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    if (!mounted) return;

    // Close the loading dialog
    Navigator.of(context).pop();

    // Replace the entire stack with Home so back-press exits the app
    context.router.replaceAll([const HomeRoute()]);
  } on FirebaseAuthException catch (e) {
    if (!mounted) return;

    // Close the loading dialog
    Navigator.of(context).pop();

    // Give the dialog a moment to fully dismiss before showing the alert
    await Future.delayed(const Duration(milliseconds: 200));
    if (!mounted) return;

    HAlertDialog.showCustomAlertBox(
      context: context,
      timerInSeconds: 3,
      backgroundColor: Colors.redAccent,
      title: 'Error',
      description: e.message ?? 'Authentication failed.',
      icon: Icons.error_outline,
    );
  } catch (e) {
    if (!mounted) return;
    Navigator.of(context).pop();
    await Future.delayed(const Duration(milliseconds: 200));
    if (!mounted) return;
    HAlertDialog.showCustomAlertBox(
      context: context,
      timerInSeconds: 3,
      backgroundColor: Colors.redAccent,
      title: 'Error',
      description: 'Something went wrong: $e',
      icon: Icons.error_outline,
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Forgot Password?",
                        style: AppTextStyle.appSubHeading
                            .copyWith(color: Color(0x80FFFFFF)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      HomixCustomBotton(
                        buttonName: "Sign in",
                        buttonColor: HomixColors.whiteColor,
                        textColor: HomixColors.backgroundColor,
                        onTap: signIn,
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
                            "Don't have an Account? ",
                            style: AppTextStyle.appSubHeading
                                .copyWith(color: HomixColors.whiteColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushRoute(SignUpRoute());
                            },
                            child: Text(
                              "Sign Up",
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
