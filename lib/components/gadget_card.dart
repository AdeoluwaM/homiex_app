import 'package:flutter/material.dart';
import 'package:homix/components/vertical_power_toggle.dart';
import 'package:homix/theme/app_colors.dart';
import 'package:homix/typography/text_style.dart';

class GadgetCard extends StatelessWidget {
  const GadgetCard(
      {super.key,
      required this.isSelected,
      required this.icon,
      required this.gadgetName,
      required this.onTap,
      required this.gadgetUnit,
      required this.gadgetReading,
      required this.onToggle,
      required this.isOn});

  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;
  final String gadgetName;
  final String gadgetUnit;
  final String gadgetReading;
  final bool isOn;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Color(0x0FFFFFFF),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected
                  ? HomixColors.whiteColor
                  : Color(0x1AFFFFFF),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // icon + on/off button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: HomixColors.whiteColor, size: 28),
                  VerticalPowerToggle(
                    value: isOn,
                    onChanged: onToggle,
                  )
                ],
              ),
              SizedBox(height: 12),
              // divider line
              Container(
                height: 1,
                color: HomixColors.whiteColor.withOpacity(0.2),
              ),
              SizedBox(height: 12),
              // bottom row with text
              Text(gadgetName,
                  style: AppTextStyle.appTitle
                      .copyWith(color: HomixColors.whiteColor, fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(gadgetUnit,
                    style: AppTextStyle.appSubTitle
                        .copyWith(color: HomixColors.tertiaryColor, fontSize: 14)),
                Text(
                  gadgetReading,
                  style: AppTextStyle.appSubTitle
                      .copyWith(color: HomixColors.whiteColor, fontSize: 14)),
              ]),
            ],
          ),
        ));
  }
}
