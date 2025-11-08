import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class BookingStepsIndicator extends StatefulWidget {
  final int currentStep; // 1 to 3

  const BookingStepsIndicator({super.key, required this.currentStep});

  @override
  State<BookingStepsIndicator> createState() => _BookingStepsIndicatorState();
}

class _BookingStepsIndicatorState extends State<BookingStepsIndicator> {
  final player = AudioPlayer();

  @override
  void didUpdateWidget(covariant BookingStepsIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentStep != oldWidget.currentStep &&
        widget.currentStep > oldWidget.currentStep) {
      player.play(
        AssetSource('sounds/zapsplat_multimedia_alert_bell_chime_event_notification_001_57852.mp3'),
      );

    }
  }

  Widget _buildStep({
    required bool isCompleted,
    required String label,
    required String number,
  }) {
    final circleColor = isCompleted ? Colors.green : Colors.grey[400];
    final textColor = isCompleted ? Colors.black87 : Colors.grey[600];

    return Row(
      children: [
        AnimatedScale(
          duration: const Duration(milliseconds: 300),
          scale: isCompleted ? 1.1 : 1.0,
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) =>
                    ScaleTransition(scale: anim, child: child),
                child: isCompleted
                    ? const Icon(
                  Icons.check,
                  key: ValueKey('check'),
                  color: Colors.white,
                  size: 18,
                )
                    : Text(
                  number,
                  key: ValueKey('number'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }


  Widget _buildDivider(int step) {
    final isActive = widget.currentStep > step;
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: 1.5,
        color: isActive ? Colors.green : Colors.grey[300],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStep(
          isCompleted: widget.currentStep > 1,
          label: 'Book',
          number: '1',
        ),
        _buildDivider(1),
        _buildStep(
          isCompleted: widget.currentStep > 2,
          label: 'Pay',
          number: '2',
        ),
        _buildDivider(2),
        _buildStep(
          isCompleted: widget.currentStep > 3,
          label: 'E-Ticket',
          number: '3',
        ),
      ],
    );
  }
}
