import 'package:flutter/material.dart';
import 'package:homix/theme/app_colors.dart';

class PowerToggle extends StatefulWidget {
  const PowerToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<PowerToggle> createState() => _PowerToggleState();
}

class _PowerToggleState extends State<PowerToggle> {
  @override
  Widget build(BuildContext context) {
    const double trackWidth = 70;
    const double trackHeight = 36;
    const double padding = 4;
    const double thumbSize = trackHeight - padding * 2;

    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: trackWidth,
        height: trackHeight,
        padding: const EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: const Color(0xFF1B2A3A), // dark navy track
          borderRadius: BorderRadius.circular(trackHeight / 2),
          border: Border.all(
            color: Colors.white.withOpacity(0.08),
            width: 1,
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: thumbSize,
            height: thumbSize,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.power_settings_new,
              size: 26,
              color: widget.value
                  ? HomixColors.secondaryColor // green when ON
                  : Colors.grey.shade500,   // grey when OFF
            ),
          ),
        ),
      ),
    );
  }
}