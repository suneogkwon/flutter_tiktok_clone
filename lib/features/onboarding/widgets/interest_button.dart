import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';

class InterestButton extends HookWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  void _onTap(ValueNotifier<bool> isSelected) {
    isSelected.value = !isSelected.value;
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = useState(false);

    return GestureDetector(
      onTap: () => _onTap(isSelected),
      child: AnimatedContainer(
        duration: 300.ms,
        padding: EdgeInsets.symmetric(
          vertical: Sizes.$16,
          horizontal: Sizes.$24,
        ),
        decoration: BoxDecoration(
            color: isSelected.value
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(
              Sizes.$32,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 5,
              ),
            ]),
        child: Text(
          interest,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isSelected.value ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
