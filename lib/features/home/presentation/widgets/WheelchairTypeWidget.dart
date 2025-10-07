import 'package:flutter/material.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class WheelchairTypeWidget extends StatefulWidget {
  const WheelchairTypeWidget({super.key});

  @override
  State<WheelchairTypeWidget> createState() => _WheelchairTypeWidgetState();
}

class _WheelchairTypeWidgetState extends State<WheelchairTypeWidget> {
  bool isElectric = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTypeButton(
              title: "Electric",
              image: "assets/images/png/cycle.png",
              isSelected: isElectric,
              onTap: () => setState(() => isElectric = true),
            ),
            const SizedBox(width: 16),
            _buildTypeButton(
              title: "Non Electric",
              image: "assets/images/png/cycle2.png",
              isSelected: !isElectric,
              onTap: () => setState(() => isElectric = false),
            ),
          ],
        ),

        const SizedBox(height: 30),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isElectric ? _buildElectricBody() : _buildNonElectricBody(),
        ),
      ],
    );
  }

  Widget _buildTypeButton({
    required String title,
    required String image,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.primary, width: 1.5),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColor.primary.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 50,
              height: 50,
              color: isSelected ? Colors.black : AppColor.primary,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.black : AppColor.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElectricBody() {
    return Container(
      key: const ValueKey('electric'),
      child: const Text(
        '⚡ Electric Wheelchairs List',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildNonElectricBody() {
    return Container(
      key: const ValueKey('non-electric'),
      child: const Text(
        '🧑‍🦽 Manual Wheelchairs List',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
