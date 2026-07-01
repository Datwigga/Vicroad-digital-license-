import 'package:digital_license/data/data_sources/local/local_vehicle_data_source.dart';
import 'package:digital_license/data/data_sources/remote/remote_vehicle_data_source.dart';
import 'package:digital_license/data/mappers/vehicle_mapper.dart';
import 'package:digital_license/data/mocks/mock_data.dart';
import 'package:digital_license/domain/entities/vehicle.dart';
import 'package:digital_license/domain/repositories/vehicle_repository.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final RemoteVehicleDataSource remoteDataSource;
  final LocalVehicleDataSource localDataSource;

  VehicleRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Vehicle>> fetchVehicles() async {
    try {
      final remoteVehicles = await remoteDataSource.fetchVehicles();
      await localDataSource.cacheVehicles(remoteVehicles);
      return remoteVehicles.map((dto) => VehicleMapper.toDomain(dto)).toList();
    } catch (e) {
      return MockData.generateVehicles();
    }
  }

  @override
  Future<Vehicle> searchVehicleByPlate(String plate) async {
    final vehicles = await fetchVehicles();
    return vehicles.firstWhere(
      (v) => v.registrationPlate.toLowerCase() == plate.toLowerCase(),
      orElse: () => throw Exception('Vehicle not found'),
    );
  }
}