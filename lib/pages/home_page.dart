import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homix/components/gadget_card.dart';
import 'package:homix/components/homix_nav_bar.dart';
import 'package:homix/components/power_toggle.dart';
import 'package:homix/gen/assets.gen.dart';
import 'package:homix/router/app_router.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _voiceAutomationOn = true; // for switching voice automation

  bool _toggleOn = true;

  int? _selectedIndex;

  final List<bool> _isOn = [true, false, false, false];

  final List<Map<String, dynamic>> _devices = const [
    {
      'icon': Icons.ac_unit,
      'title': 'Air condition',
      'subtitle': 'Temperature',
      'status': '30c',
      // 'route': AirConditionRoute(),
    },
    {
      'icon': Icons.lightbulb_outline,
      'title': 'Smart bulb',
      'subtitle': 'Voltage',
      'status': '----',
      // 'route': LightControlRoute(),
    },
    {
      'icon': Icons.tv,
      'title': 'Smart TV',
      'subtitle': 'Displaying',
      'status': '----',
      // 'route': TvControlRoute(),
    },
    {
      'icon': Icons.album_outlined,
      'title': 'Bluetooth Mp3',
      'subtitle': 'Not connected',
      'status': '----',
      // 'route': MusicControlRoute(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          AssetImage(Assets.images.homixProfilePhoto.path),
                    ),
                    SizedBox(width: 10),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome Back",
                              style: AppTextStyle.appSubHeading
                                  .copyWith(color: HomixColors.whiteColor)),
                          Text(
                            "Claire David,",
                            style: AppTextStyle.appSubHeading
                                .copyWith(color: HomixColors.secondaryColor),
                          ),
                        ]),
                  ],
                ),
                // for the notification icon
                CircleAvatar(
                    radius: 22,
                    backgroundColor: HomixColors.tertiaryColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_none_outlined),
                      color: HomixColors.whiteColor,
                    ))
              ],
            ),
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: Color(0x1AFFFFFF),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0x0FFFFFFF)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // text
                      Text("Swith voice automation",
                          style: AppTextStyle.appSubHeading.copyWith(
                              color: HomixColors.whiteColor, fontSize: 16)),
                      Container(
                        child: PowerToggle(
                          value: _voiceAutomationOn,
                          onChanged: (val) {
                            setState(() => _voiceAutomationOn = val);
                            // Call your voice automation toggle logic here
                          },
                        ),
                      )
                      // on and off button
                    ]),
              ),
            ),
            SizedBox(height: 60),
            // listview for the cards
            GridView.builder(
              itemCount: _devices.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85),
              itemBuilder: (context, index) {
                final device = _devices[index];

                return GadgetCard(
                  icon: device['icon'],
                  gadgetName: device['title'],
                  gadgetUnit: device['subtitle'],
                  gadgetReading: device['status'],
                  isOn: _isOn[index],
                  isSelected: _selectedIndex == index,
                  onToggle: (val) {
                    setState(() {
                      _isOn[index] = val;
                    });
                  },
                  // onTap: () {
                  //   setState(() {
                  //     _selectedIndex = index;
                  //     context.router.push(device['route']);
                  //     // _selectedIndex = _selectedIndex == index ? null : index;
                  //     // The Navigation to the Next page will be Here ???
                  //   });
                  // },
                  onTap: () {
                    final title = device['title'] as String;
                    final status = device['status'] as String;

                    setState(() => _selectedIndex = index);

                    switch (index) {
                      case 0:
                        context.router.push(AirConditionRoute(
                            title: title,
                            // status: status,
                            isOn: _isOn[index],
                            onToggle: (value) {
                              setState(() {
                                _isOn[index] = value;
                              });
                            }));
                        break;
                      case 1:
                        context.router.push(LightControlRoute(title: title));
                        break;
                      case 2:
                        context.router.push(TvControlRoute(
                            title: title,
                            isOn: _isOn[index],
                            onToggle: ((value) {
                              setState(() {
                                _isOn[index] = value;
                              });
                            })));
                        break;
                      case 3:
                        context.router.push(MusicControlRoute(title: title));
                        break;
                    }
                  },
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            HomixNavBar(),
          ],
        ),
      ),
    )));
  }
}
