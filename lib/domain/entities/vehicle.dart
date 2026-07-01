import 'package:equatable/equatable.dart';

enum RegistrationStatus { current, dueSoon, expired }

class Vehicle extends Equatable {
  final String vin;
  final String registrationPlate;
  final String make;
  final String model;
  final int year;
  final String colour;
  final String registrationNumber;
  final String expiryDate;
  final RegistrationStatus status;
  final String owner;
  final String insuranceExpiry;

  const Vehicle({
    required this.vin,
    required this.registrationPlate,
    required this.make,
    required this.model,
    required this.year,
    required this.colour,
    required this.registrationNumber,
    required this.expiryDate,
    required this.status,
    required this.owner,
    required this.insuranceExpiry,
  });

  @override
  List<Object?> get props => [vin, registrationPlate, make, model, year, colour, registrationNumber, expiryDate, status, owner, insuranceExpiry];
}