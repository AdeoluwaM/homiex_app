import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homix/components/homix_app_bar.dart';
import 'package:homix/components/power_toggle.dart';
import 'package:homix/gen/assets.gen.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';

@RoutePage()
class TvControlPage extends StatefulWidget {
  const TvControlPage(
      {super.key,
      required this.title,
      required this.isOn,
      required this.onToggle});

  final String title;
  final bool isOn;
  final ValueChanged<bool> onToggle;

  @override
  State<TvControlPage> createState() => _TvControlPageState();
}

class _TvControlPageState extends State<TvControlPage> {
  int selectedModeIndex = 0;

  final List<String> menu = ['All', 'Sports', 'Music', 'Movie'];

  // final bool isSelected = false;
  int? selectedDeviceIndex;

  final List<Map<String, dynamic>> devices = [
    {'deviceIcon': Image.asset(Assets.images.homixNetflixLogo.path)},
    {'deviceIcon': Image.asset(Assets.images.homixYoutubeLogo.path)},
    {'deviceIcon': Image.asset(Assets.images.homixSpotifyLogo.path)},
    {'deviceIcon': Image.asset(Assets.images.homixEspnLogo.path)},
    {'deviceIcon': Image.asset(Assets.images.homixNetflixLogo.path)},
    {'deviceIcon': Image.asset(Assets.images.homixYoutubeLogo.path)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomixAppBar(screenName: widget.title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 205,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: HomixColors.whiteColor)),
                  child: Image.asset(
                    Assets.images.homixTvScreen.path,
                    fit: BoxFit.cover,
                    
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Power",
                          style: AppTextStyle.appTitle.copyWith(
                              color: HomixColors.whiteColor, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PowerToggle(
                            value: widget.isOn, onChanged: widget.onToggle)
                      ],
                    ),
                    Text(
                      "Standby",
                      style: AppTextStyle.appTitle.copyWith(
                          color: HomixColors.whiteColor, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Standby",
                      style: AppTextStyle.appTitle.copyWith(
                          color: HomixColors.whiteColor, fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0x0FFFFFFF)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            menu.length,
                            ((index) {
                              final modeSelected = selectedModeIndex == index;
                              return GestureDetector(
                                onTap: () =>
                                    setState(() => selectedModeIndex = index),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: modeSelected
                                        ? const Color(0xFF00C48C)
                                        : Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 12),
                                    child: Text(
                                      menu[index],
                                      style: AppTextStyle.appSubTitle.copyWith(
                                          fontSize: 16,
                                          color: modeSelected
                                              ? HomixColors.whiteColor
                                              : HomixColors.secondaryColor),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                    shrinkWrap: true, 
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.25),
                    itemCount: devices.length,
                    itemBuilder: (context, index) {

                      final isSelected = selectedDeviceIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDeviceIndex = isSelected ? null : index;
                          });
                        },
                        child: Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0x1AFFFFFF),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: isSelected
                                      ? HomixColors.whiteColor
                                      : Color(0x1AFFFFFF))),
                          child: devices[index]['deviceIcon'],
                        ),
                      );
                    })
                // COntinue to UI
              ],
            ),
          ),
        ),
      ),
    );
  }
}
