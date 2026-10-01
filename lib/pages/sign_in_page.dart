import 'package:flutter/material.dart';
import 'package:homix/components/homix_custom_botton.dart';
import 'package:homix/components/homix_textfield.dart';
import 'package:homix/gen/assets.gen.dart';
import 'package:homix/pages/sign_up_page.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                        onTap: () {},
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
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
