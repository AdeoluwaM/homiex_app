import 'package:flutter/material.dart';
import 'package:homix/typography/text_style.dart';

class HomixCustomBotton extends StatelessWidget {
  const HomixCustomBotton(
      {super.key,
      required this.buttonName,
      required this.buttonColor,
      required this.textColor,
      required this.onTap});

  final String buttonName;
  final Color buttonColor;
  final Color textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // padding: EdgeInsets.all(),
          width: double.infinity,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              buttonName,
              style: AppTextStyle.appSubHeading
                  .copyWith(fontSize: 16, color: textColor),
            )),
          ),
        ),
      ),
    );
  }
}
