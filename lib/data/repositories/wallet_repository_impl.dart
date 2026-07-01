import 'package:digital_license/data/data_sources/local/local_driver_license_data_source.dart';
import 'package:digital_license/data/data_sources/remote/remote_driver_license_data_source.dart';
import 'package:digital_license/data/mappers/driver_license_mapper.dart';
import 'package:digital_license/data/mocks/mock_data.dart';
import 'package:digital_license/domain/entities/driver_license.dart';
import 'package:digital_license/domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  final RemoteDriverLicenseDataSource remoteDataSource;
  final LocalDriverLicenseDataSource localDataSource;

  WalletRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<DriverLicense>> fetchDriverLicenses() async {
    try {
      final remoteLicenses = await remoteDataSource.fetchDriverLicenses();
      await localDataSource.cacheLicenses(remoteLicenses);
      return remoteLicenses.map((dto) => DriverLicenseMapper.toDomain(dto)).toList();
    } catch (e) {
      return MockData.generateDriverLicenses();
    }
  }
}