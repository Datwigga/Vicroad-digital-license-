import 'package:digital_license/core/network/api_client.dart';
import 'package:digital_license/data/models/vehicle_dto.dart';

abstract class RemoteVehicleDataSource {
  Future<List<VehicleDto>> fetchVehicles();
}

class RemoteVehicleDataSourceImpl implements RemoteVehicleDataSource {
  final ApiClient apiClient;

  RemoteVehicleDataSourceImpl(this.apiClient);

  @override
  Future<List<VehicleDto>> fetchVehicles() async {
    try {
      final response = await apiClient.get('/api/vehicles');
      final List<dynamic> vehiclesList = response['data']['vehicles'] ?? [];
      return vehiclesList.map((json) => VehicleDto.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch vehicles: $e');
    }
  }
}