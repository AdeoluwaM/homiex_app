import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homix/components/homix_app_bar.dart';
import 'package:homix/gen/assets.gen.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';

@RoutePage()
class AirConditionPage extends StatefulWidget {
  const AirConditionPage({super.key, required this.title});
   
   final String title;

  @override
  State<AirConditionPage> createState() => _AirConditionPageState();
}


class _AirConditionPageState extends State<AirConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomixAppBar(screenName: widget.title,),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Image.asset(Assets.images.acImage.path),
          ],
        ),
      ),
    );
  }
}
