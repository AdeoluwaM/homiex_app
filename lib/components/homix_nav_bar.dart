import 'package:flutter/material.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';

class HomixNavBar extends StatefulWidget {
  const HomixNavBar({super.key});

  @override
  State<HomixNavBar> createState() => _HomixNavBarState();
}

class _HomixNavBarState extends State<HomixNavBar> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _items = [
    {
      'icon': Icons.home_outlined,
      'label': 'Home',
    },
    {
      'icon': Icons.devices_other_outlined,
      'label': 'Devices',
    },
    {
      'icon': Icons.settings_outlined,
      'label': 'Settings',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0x0FFFFFFF),
        border: Border.all(width: 1, color: Color(0x1AFFFFFF)),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_items.length, ((index) {
          final bool isSelected = _selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Icon(
                    _items[index]['icon'],
                    size: 24,
                    color: isSelected
                        ? HomixColors.secondaryColor
                        : HomixColors.whiteColor,
                  ),
                  if (isSelected) ...[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      _items[index]['label'],
                      style: AppTextStyle.appSubTitle
                          .copyWith(color: isSelected
                        ? HomixColors.secondaryColor
                        : HomixColors.whiteColor, fontSize: 16),
                    )
                  ]
                ],
              ),
            ),
          );
        })),
      ),
    );
  }
}
