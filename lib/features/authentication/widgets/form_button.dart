import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.isEnabled,
    this.onTap,
    this.label = 'next',
  });

  final bool isEnabled;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? () => onTap?.call() : null,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          duration: 200.ms,
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.$16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Sizes.$5,
            ),
            color: isEnabled
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade300,
          ),
          child: AnimatedDefaultTextStyle(
            duration: 200.ms,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isEnabled ? Colors.white : Colors.grey.shade400,
              fontWeight: FontWeight.w600,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
