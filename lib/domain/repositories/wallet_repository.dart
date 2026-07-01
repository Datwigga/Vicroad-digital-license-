import 'package:digital_license/domain/entities/driver_license.dart';

abstract class WalletRepository {
  Future<List<DriverLicense>> fetchDriverLicenses();
}