import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homix/components/homix_app_bar.dart';
import 'package:homix/components/power_toggle.dart';
import 'package:homix/gen/assets.gen.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';

@RoutePage()
class MusicControlPage extends StatefulWidget {
  const MusicControlPage(
      {super.key,
      required this.title,
      required this.isOn,
      required this.onToggle});

  final String title;
  final bool isOn;
  final ValueChanged<bool> onToggle;

  @override
  State<MusicControlPage> createState() => _MusicControlPageState();
}

class _MusicControlPageState extends State<MusicControlPage> {
  double _batteryLevel = 80;

  int _selectedIndex = 0;

  final List<Map<String, dynamic>> modes = [
    {
      'icon': Icons.repeat,
      'label': 'Loop',
    },
    {'icon': Icons.airplay, 'label': 'Airplay'},
    {'icon': Icons.graphic_eq, 'label': 'EQ'},
    {'icon': Icons.link, 'label': 'Pair'},
  ];

  void _handleLoop() {}

  void _handleAirplay() {}

  void _handleEQ() {}

  void _handlePair() {}

  _onModeTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        _handleLoop();
        break;
      case 1:
        _handleAirplay();
        break;
      case 2:
        _handleEQ();
        break;
      case 3:
        _handlePair();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomixAppBar(screenName: widget.title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircularSlider(
                    value: _batteryLevel,
                    onChanged: (value) {
                      setState(() {
                        _batteryLevel = value;
                      });
                    },
                  ),
                  Text(
                    "1hr until Charge",
                    style: AppTextStyle.appSubTitle.copyWith(
                        color: HomixColors.tertiaryColor, fontSize: 14),
                  )
                ],
              ),
              // increase this sizedbox to adjust space
              SizedBox(
                height: 00,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Power",
                        style: AppTextStyle.appTitle.copyWith(
                            color: HomixColors.whiteColor, fontSize: 18),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      PowerToggle(
                          value: widget.isOn, onChanged: widget.onToggle),
                    ],
                  ),
                  SizedBox(
                    height: 376,
                    width: 249,
                    child: Image.asset(
                      Assets.images.homixMusicSpeaker.path,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  modes.length,
                  ((index) {
                    final mode = modes[index];
                    final isSelected = _selectedIndex == index;

                    return GestureDetector(
                      onTap: () => _onModeTapped(index),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0x1AFFFFFF),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 1,
                                color: isSelected
                                    ? HomixColors.whiteColor
                                    : Color(0x1AFFFFFF))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                modes[index]['icon'],
                                color: HomixColors.whiteColor,
                                size: 28,
                              ),
                              Text(
                                modes[index]['label'],
                                style: AppTextStyle.appSubTitle.copyWith(
                                    color: HomixColors.whiteColor,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
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
                      horizontal: 8.0, vertical: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(Assets.images.nowPlayingImage.path),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Now Playing",
                                style: AppTextStyle.appSubTitle.copyWith(
                                    color: HomixColors.whiteColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Supertramp - The logical Sound",
                                style: AppTextStyle.appSubTitle.copyWith(
                                    color: HomixColors.tertiaryColor,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(),
                      // A music progress indicator
                      // LinearProgressIndicator(),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.fast_rewind_rounded,
                                color: HomixColors.whiteColor,
                                size: 25,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_left_rounded,
                                color: HomixColors.whiteColor,
                                size: 40,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow_rounded,
                                color: HomixColors.whiteColor,
                                size: 40,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_right_rounded,
                                // Icons.arrow_right_rounded,
                                color: HomixColors.whiteColor,
                                size: 40,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.fast_forward_rounded,
                                // Icons.arrow_right_rounded,
                                color: HomixColors.whiteColor,
                                size: 25,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              //Continue The UI Above
            ],
          ),
        ),
      ),
    );
  }
}

class CircularSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const CircularSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  void _updateValue(Offset position) {
    const size = 76.0;
    const center = Offset(size / 2, size / 2);

    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;

    double angle = math.atan2(dy, dx) + math.pi / 2;

    if (angle < 0) {
      angle += 2 * math.pi;
    }

    onChanged(
      (angle / (2 * math.pi) * 100).clamp(0.0, 100.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        _updateValue(details.localPosition);
      },
      onTapDown: (details) {
        _updateValue(details.localPosition);
      },
      child: SizedBox(
        width: 76,
        height: 76,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(76, 76),
              painter: CircularSliderPainter(
                value: value / 100,
              ),
            ),
            Container(
              width: 39,
              height: 39,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF20314C),
              ),
              child: Text(
                '${value.round()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularSliderPainter extends CustomPainter {
  final double value;

  CircularSliderPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    const radius = 20.0;

    // DOTTED OUTER RING
    final dotPaint = Paint()
      ..color = Colors.white38
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 36; i++) {
      final angle = i * 2 * math.pi / 36;

      final point = Offset(
        center.dx + 30 * math.cos(angle),
        center.dy + 30 * math.sin(angle),
      );

      canvas.drawCircle(point, 0.7, dotPaint);
    }

    // BACKGROUND TRACK
    final trackPaint = Paint()
      ..color = Colors.white12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, radius, trackPaint);

    // GREEN PROGRESS ARC
    final progressPaint = Paint()
      ..color = const Color(0xFF00C995)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -math.pi / 2,
      2 * math.pi * value,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(
    covariant CircularSliderPainter oldDelegate,
  ) {
    return oldDelegate.value != value;
  }
}
