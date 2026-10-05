import 'package:flutter/material.dart';
import 'package:homix/theme/app_colors.dart';

class VerticalPowerToggle extends StatelessWidget {
  const VerticalPowerToggle({
    super.key,
    required this.value,
    required this.onChanged,
    this.width = 44,
    this.height = 78,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    const double padding = 5;
    final double thumbSize = width - padding * 2;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        padding: const EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: const Color(0xFF16202E), // dark track
          borderRadius: BorderRadius.circular(width / 2),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment:
              value ? Alignment.topCenter : Alignment.bottomCenter,
          child: Container(
            width: thumbSize,
            height: thumbSize,
            decoration: BoxDecoration(
              color: value
                  ? HomixColors.secondaryColor // green ON
                  : const Color(0xFFD9D9D9), // light grey OFF
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.power_settings_new,
              size: thumbSize * 0.6,
              color: value ? Colors.white : const Color(0xFF1B2A3A),
            ),
          ),
        ),
      ),
    );
  }
}