import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homix/components/homix_app_bar.dart';
import 'package:homix/components/power_toggle.dart';
import 'package:homix/gen/assets.gen.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';

@RoutePage()
class AirConditionPage extends StatefulWidget {
  const AirConditionPage(
      {super.key,
      required this.title,
      // required this.status,
      required this.isOn,
      required this.onToggle});

  final String title;
  // final String status;
  final bool isOn;
  final ValueChanged<bool> onToggle;

  @override
  State<AirConditionPage> createState() => _AirConditionPageState();
}

class _AirConditionPageState extends State<AirConditionPage> {
  double _temperature = 26;
  final double _minTemp = 16;
  final double _maxTemp = 32;

  void _changeTemperature(double change) {
    setState(() {
      _temperature =
          (_temperature + change).clamp(_minTemp, _maxTemp).toDouble();
    });
  }

  int selectedModeIndex = 1;

  double _speedValue = 3;

  final List<Map<String, dynamic>> modes = [
    {'icon': Icons.wb_sunny_outlined, 'label': 'Hot'},
    {'icon': Icons.ac_unit, 'label': 'Cold'},
    {'icon': Icons.water_drop_outlined, 'label': 'Humid'},
    {'icon': Icons.air, 'label': 'Dry air'},
  ];

  @override
  Widget build(BuildContext context) {
    final double progress = (_temperature - _minTemp) / (_maxTemp - _minTemp);

    return Scaffold(
      appBar: HomixAppBar(
        screenName: widget.title,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(children: [
                Image.asset(
                  Assets.images.acImage.path,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 30,
                ),
                // Circular slider and power on and off button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // coolumn for power on/off
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Power",
                          style: AppTextStyle.appTitle.copyWith(
                              color: HomixColors.whiteColor, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PowerToggle(
                            value: widget.isOn, onChanged: widget.onToggle),
                      ],
                    ),
                    // column for slider
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // circular slider
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(
                            begin: 0,
                            end: progress,
                          ),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          builder: (context, animatedProgress, child) {
                            return CustomPaint(
                              size: const Size(100, 100),
                              painter: _DialPainter(
                                progress: animatedProgress,
                              ),
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Center(
                                  child: Text(
                                    '${_temperature.toInt()}°C',
                                    style: AppTextStyle.appTitle.copyWith(
                                      color: HomixColors.whiteColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: _temperature < _maxTemp
                                  ? () => _changeTemperature(1)
                                  : null,
                              icon: const Icon(Icons.add_circle),
                              color: HomixColors.whiteColor,
                            ),
                            IconButton(
                              onPressed: _temperature > _minTemp
                                  ? () => _changeTemperature(-1)
                                  : null,
                              icon: const Icon(Icons.remove_circle),
                              color: HomixColors.whiteColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // level
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0x1AFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0x0FFFFFFF)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        modes.length,
                        ((index) {
                          final modeSelected = selectedModeIndex == index;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => selectedModeIndex = index),
                            child: Column(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: modeSelected
                                        ? Colors.white
                                        : const Color(0xFF2C354D),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    modes[index]['icon'],
                                    color: modeSelected
                                        ? const Color(0xFF00C48C)
                                        : Colors.grey,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  modes[index]['label'],
                                  style: AppTextStyle.appTitle.copyWith(
                                    color: modeSelected
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                // other parts of the UI
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Speed Adjustment",
                      style: AppTextStyle.appTitle.copyWith(
                          color: HomixColors.whiteColor, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      // mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey.shade700,
                            thumbColor: Colors.white,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 8),
                            trackHeight: 2,
                            overlayShape: SliderComponentShape.noOverlay,
                          ),
                          child: Slider(
                            value: _speedValue,
                            min: 0,
                            max: 6,
                            divisions: 6,
                            onChanged: (value) =>
                                setState(() => _speedValue = value),
                          ),
                        ),
                        Icon(Icons.ac_unit,
                            color: HomixColors.secondaryColor, size: 20),
                      ],
                    ),
                  ],
                ),
              ]),
            )),
          ),
          // continue the UI
          Container(
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Scheduled time",
                        style: AppTextStyle.appTitle.copyWith(
                            color: HomixColors.whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            color: HomixColors.secondaryColor,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "10:00 pm --- 11:30pm",
                        style: AppTextStyle.appTitle.copyWith(
                            color: HomixColors.whiteColor, fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.power_settings_new_rounded,
                            color: HomixColors.whiteColor,
                          ))
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "10:00 pm --- 11:30pm",
                        style: AppTextStyle.appTitle.copyWith(
                            color: HomixColors.whiteColor, fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.power_settings_new_rounded,
                            color: HomixColors.whiteColor,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DialPainter extends CustomPainter {
  final double progress; // 0.0 to 1.0

  _DialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 12;
    const strokeWidth = 8.0;

    // Background track (light grey full circle)
    final bgPaint = Paint()
      ..color = const Color(0xFFE0E0E0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Foreground arc (green progress)
    // Start from top (-pi/2) and sweep clockwise
    final startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;

    final progressPaint = Paint()
      ..color = const Color(0xFF2FBF8F) // teal/green
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );

    // Dark dot at the end of the progress arc
    final endAngle = startAngle + sweepAngle;
    final dotCenter = Offset(
      center.dx + radius * math.cos(endAngle),
      center.dy + radius * math.sin(endAngle),
    );

    final dotPaint = Paint()..color = const Color(0xFF1B1F2E);
    canvas.drawCircle(dotCenter, strokeWidth * 0.75, dotPaint);

    // Small border ring around dot for a nicer look
    final dotBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(dotCenter, strokeWidth * 0.75, dotBorder);
  }

  @override
  bool shouldRepaint(covariant _DialPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class _RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _RoundButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFE0E0E0),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Icon(icon, size: 28, color: Colors.black),
        ),
      ),
    );
  }
}
