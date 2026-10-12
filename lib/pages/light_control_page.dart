import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homix/components/homix_app_bar.dart';
import 'package:homix/components/power_toggle.dart';
import 'package:homix/gen/assets.gen.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';

@RoutePage()
class LightControlPage extends StatefulWidget {
  const LightControlPage(
      {super.key,
      required this.title,
      required this.isOn,
      required this.onToggle});

  final String title;
  final bool isOn;
  final ValueChanged<bool> onToggle;

  @override
  State<LightControlPage> createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  double _brightness = 70.0;

  //  _brightness / 100,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomixAppBar(screenName: widget.title),
      body: Stack(children: [
        Positioned(
            top: 0,
            right: 10,
            child: Image.asset(Assets.images.homixLightBulb.path, fit: BoxFit.contain,)),
        Column(
          children: [
            SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Power",
                    style: AppTextStyle.appTitle
                        .copyWith(color: HomixColors.whiteColor, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PowerToggle(value: widget.isOn, onChanged: widget.onToggle),
                  SizedBox(
                    height: 30,
                  ),
                  // brightness percentage
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_brightness.toInt()}%",
                        style: AppTextStyle.appTextHeading.copyWith(
                            color: HomixColors.whiteColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Brightness",
                        style: AppTextStyle.appSubTitle.copyWith(
                            color: HomixColors.secondaryColor, fontSize: 12),
                      ),
                    ],
                  ),
                  // slider UI
                  SizedBox(
                    height: 250,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Color(0x80FFFFFF),
                                  inactiveTrackColor: Color(0x33FFFFFF),
                                  trackHeight: 2.0,
                                  thumbColor: HomixColors.whiteColor,
                                  overlayColor: Color(0x1AFFFFFF),
                                  overlayShape: const RoundSliderOverlayShape(
                                      overlayRadius: 20.0),
                                  thumbShape: RoundSliderThumbShape(
                                      elevation: 4.0, enabledThumbRadius: 10.0),
                                ),
                                child: Slider(
                                    value: _brightness,
                                    min: 0,
                                    max: 100,
                                    onChanged: (value) {
                                      setState(() {
                                        _brightness = value;
                                      });
                                    })),
                          ),
                          Icon(
                            Icons.lightbulb_outline_rounded,
                            color: HomixColors.secondaryColor,
                          ),
                        ],
                      ),
                      // the levelers
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(10, (index) {
                            return Text(
                              '|',
                              style: AppTextStyle.appSubTitle
                                  .copyWith(color: HomixColors.whiteColor),
                            );
                          })),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            // Footer UI
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        border: Border.all(color: Color(0x0FFFFFFF)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Schedule",
                              style: AppTextStyle.appTitle.copyWith(
                                  color: HomixColors.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "From: ",
                                      style: AppTextStyle.appSubHeading
                                          .copyWith(
                                              color: HomixColors.whiteColor)),
                                  TextSpan(
                                      text: "10:00 PM  ",
                                      style: AppTextStyle.appSubHeading
                                          .copyWith(
                                              color:
                                                  HomixColors.secondaryColor)),
                                  TextSpan(
                                      text: "To: ",
                                      style: AppTextStyle.appSubHeading
                                          .copyWith(
                                              color: HomixColors.whiteColor)),
                                  TextSpan(
                                      text: "01:00 AM",
                                      style: AppTextStyle.appSubHeading
                                          .copyWith(
                                              color:
                                                  HomixColors.secondaryColor)),
                                ])),
                                Expanded(child: Container()),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      color: HomixColors.whiteColor,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HomixColors.whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        border: Border.all(color: HomixColors.whiteColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Daily Usage",
                                  style: AppTextStyle.appSubTitle.copyWith(
                                      color: HomixColors.backgroundColor,
                                      fontSize: 14),
                                ),
                                Text(
                                  "1.5KWH",
                                  style: AppTextStyle.appSubTitle.copyWith(
                                      color: HomixColors.secondaryColor,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Monthly Usage",
                                  style: AppTextStyle.appSubTitle.copyWith(
                                      color: HomixColors.backgroundColor,
                                      fontSize: 14),
                                ),
                                Text(
                                  "185KWH",
                                  style: AppTextStyle.appSubTitle.copyWith(
                                      color: HomixColors.secondaryColor,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Usage Hours",
                                  style: AppTextStyle.appSubTitle.copyWith(
                                      color: HomixColors.backgroundColor,
                                      fontSize: 14),
                                ),
                                Text(
                                  "5000Hrs",
                                  style: AppTextStyle.appSubTitle.copyWith(
                                      color: HomixColors.secondaryColor,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
