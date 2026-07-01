import 'package:flutter/material.dart';
import 'package:digital_license/domain/entities/vehicle.dart';

class StatusBadgeWidget extends StatelessWidget {
  final RegistrationStatus status;

  const StatusBadgeWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    String label;

    switch (status) {
      case RegistrationStatus.current:
        color = Colors.green;
        label = 'Current';
        break;
      case RegistrationStatus.dueSoon:
        color = Colors.orange;
        label = 'Due Soon';
        break;
      case RegistrationStatus.expired:
        color = Colors.red;
        label = 'Expired';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}