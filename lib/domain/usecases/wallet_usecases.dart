import 'package:digital_license/domain/entities/driver_license.dart';
import 'package:digital_license/domain/repositories/wallet_repository.dart';

class FetchDriverLicensesUseCase {
  final WalletRepository repository;
  FetchDriverLicensesUseCase(this.repository);
  Future<List<DriverLicense>> call() async => await repository.fetchDriverLicenses();
}

class WalletUseCases {
  final WalletRepository repository;
  WalletUseCases(this.repository);
  FetchDriverLicensesUseCase get fetchDriverLicenses => FetchDriverLicensesUseCase(repository);
}