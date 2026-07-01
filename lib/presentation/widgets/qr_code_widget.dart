import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeWidget extends StatefulWidget {
  final String licenseNumber;

  const QRCodeWidget({Key? key, required this.licenseNumber}) : super(key: key);

  @override
  State<QRCodeWidget> createState() => _QRCodeWidgetState();
}

class _QRCodeWidgetState extends State<QRCodeWidget> {
  late int _refreshCounter = 0;
  late Future<void> _refreshTimer;

  @override
  void initState() {
    super.initState();
    _startRefreshTimer();
  }

  void _startRefreshTimer() {
    Future.delayed(const Duration(seconds: 30), () {
      if (mounted) {
        setState(() {
          _refreshCounter++;
        });
        _startRefreshTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'QR Code',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: QrImage(
                data: '${widget.licenseNumber}:$_refreshCounter',
                version: QrVersions.auto,
                size: 200,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Refreshes every 30 seconds',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}