import 'package:digital_license/domain/entities/vehicle.dart';
import 'package:digital_license/domain/repositories/vehicle_repository.dart';

class FetchVehiclesUseCase {
  final VehicleRepository repository;
  FetchVehiclesUseCase(this.repository);
  Future<List<Vehicle>> call() async => await repository.fetchVehicles();
}

class SearchVehicleByPlateUseCase {
  final VehicleRepository repository;
  SearchVehicleByPlateUseCase(this.repository);
  Future<Vehicle> call(String plate) async => await repository.searchVehicleByPlate(plate);
}

class VehicleUseCases {
  final VehicleRepository repository;
  VehicleUseCases(this.repository);
  FetchVehiclesUseCase get fetchVehicles => FetchVehiclesUseCase(repository);
  SearchVehicleByPlateUseCase get searchVehicleByPlate => SearchVehicleByPlateUseCase(repository);
}