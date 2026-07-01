import 'package:digital_license/data/models/vehicle_dto.dart';
import 'package:digital_license/domain/entities/vehicle.dart';

class VehicleMapper {
  static Vehicle toDomain(VehicleDto dto) {
    return Vehicle(
      vin: dto.vin,
      registrationPlate: dto.registrationPlate,
      make: dto.make,
      model: dto.model,
      year: dto.year,
      colour: dto.colour,
      registrationNumber: dto.registrationNumber,
      expiryDate: dto.expiryDate,
      status: _mapStatus(dto.status),
      owner: dto.owner,
      insuranceExpiry: dto.insuranceExpiry,
    );
  }

  static RegistrationStatus _mapStatus(String status) {
    switch (status.toLowerCase()) {
      case 'duesoon':
        return RegistrationStatus.dueSoon;
      case 'expired':
        return RegistrationStatus.expired;
      default:
        return RegistrationStatus.current;
    }
  }
}