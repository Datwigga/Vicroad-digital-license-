import 'package:flutter/material.dart';

class PrivacyBlurWidget extends StatelessWidget {
  final Widget child;
  final bool isPrivacyMode;
  final Function(bool) onToggle;

  const PrivacyBlurWidget({
    Key? key,
    required this.child,
    required this.isPrivacyMode,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Privacy Mode',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Switch(
              value: isPrivacyMode,
              onChanged: onToggle,
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (isPrivacyMode)
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: child,
          )
        else
          child,
      ],
    );
  }
}

import 'dart:ui' as ui;