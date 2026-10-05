import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';

@RoutePage()
class AirConditionPage extends StatefulWidget {
  const AirConditionPage({super.key});

  @override
  State<AirConditionPage> createState() => _AirConditionPageState();
}

class _AirConditionPageState extends State<AirConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Air Condition",
          style: AppTextStyle.appTitle.copyWith(color: HomixColors.whiteColor),
        ),
        actions: [],
      ),
    );
  }
}
