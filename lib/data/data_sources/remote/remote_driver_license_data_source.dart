import 'package:digital_license/core/network/api_client.dart';
import 'package:digital_license/data/models/driver_license_dto.dart';

abstract class RemoteDriverLicenseDataSource {
  Future<List<DriverLicenseDto>> fetchDriverLicenses();
}

class RemoteDriverLicenseDataSourceImpl implements RemoteDriverLicenseDataSource {
  final ApiClient apiClient;

  RemoteDriverLicenseDataSourceImpl(this.apiClient);

  @override
  Future<List<DriverLicenseDto>> fetchDriverLicenses() async {
    try {
      final response = await apiClient.get('/api/licenses');
      final List<dynamic> licensesList = response['data']['licenses'] ?? [];
      return licensesList.map((json) => DriverLicenseDto.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch licenses: $e');
    }
  }
}