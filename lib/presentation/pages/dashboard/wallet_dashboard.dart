import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digital_license/presentation/bloc/wallet/wallet_bloc.dart';
import 'package:digital_license/presentation/widgets/license_card_widget.dart';
import 'package:digital_license/presentation/widgets/qr_code_widget.dart';
import 'package:digital_license/presentation/widgets/privacy_blur_widget.dart';

class WalletDashboard extends StatefulWidget {
  const WalletDashboard({Key? key}) : super(key: key);

  @override
  State<WalletDashboard> createState() => _WalletDashboardState();
}

class _WalletDashboardState extends State<WalletDashboard> {
  @override
  void initState() {
    super.initState();
    context.read<WalletBloc>().add(const FetchDriverLicensesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet'),
      ),
      body: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          if (state is WalletLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WalletError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is WalletLoaded && state.licenses.isNotEmpty) {
            final license = state.licenses.first;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  PrivacyBlurWidget(
                    isPrivacyMode: state.isPrivacyMode,
                    onToggle: (value) {
                      context.read<WalletBloc>().add(
                            TogglePrivacyModeEvent(isPrivate: value),
                          );
                    },
                    child: LicenseCardWidget(license: license),
                  ),
                  const SizedBox(height: 24),
                  if (!state.isPrivacyMode) QRCodeWidget(licenseNumber: license.licenseNumber),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'License Details',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 12),
                        _buildDetailRow('License Number:', license.licenseNumber),
                        _buildDetailRow('Expiry Date:', license.expiryDate),
                        _buildDetailRow('Address:', license.address),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('No licenses found'));
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}