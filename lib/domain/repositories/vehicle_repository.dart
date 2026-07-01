import 'package:digital_license/domain/entities/vehicle.dart';

abstract class VehicleRepository {
  Future<List<Vehicle>> fetchVehicles();
  Future<Vehicle> searchVehicleByPlate(String plate);
}