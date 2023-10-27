import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.icon,
    required this.label,
    this.onTap,
  });

  final String label;
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(Sizes.$14),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.$1,
            ),
          ),
          child: Stack(
            children: [
              if (icon != null) icon!,
              Align(
                alignment: Alignment.center,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.$16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
