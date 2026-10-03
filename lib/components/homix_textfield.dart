import 'package:flutter/material.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';

class HomixTextfield extends StatelessWidget {
  const HomixTextfield(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.hintText,
      required this.prefixIcon});

  final TextEditingController controller;
  final bool obscureText;
  final IconData prefixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Container(
        // padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 1, color: HomixColors.tertiaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          style: AppTextStyle.appSubHeading
              .copyWith(color: HomixColors.whiteColor, fontSize: 16),
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              prefixIcon: Icon(
                prefixIcon,
                color: HomixColors.tertiaryColor,
              ),
              hintText: hintText,
              hintStyle: AppTextStyle.appSubHeading
                  .copyWith(color: HomixColors.tertiaryColor),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
