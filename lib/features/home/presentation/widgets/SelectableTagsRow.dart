import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class SelectableTagsRow extends StatefulWidget {
  const SelectableTagsRow({super.key});

  @override
  State<SelectableTagsRow> createState() => _SelectableTagsRowState();
}

class _SelectableTagsRowState extends State<SelectableTagsRow> {
  String selectedTag = 'self_push'; // الافتراضي أول ما يفتح

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTag('self_push'),
        _buildTag('foldable'),
        _buildTag('wide_seat'),
      ],
    );
  }

  Widget _buildTag(String key) {
    final bool isSelected = selectedTag == key;
    final bgColor = isSelected ? AppColor.primary : Colors.white;
    final textColor = isSelected ? Colors.white : Colors.black87;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTag = key;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.black12.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            key.tr(),
            style: TextStyle(
              color: textColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
