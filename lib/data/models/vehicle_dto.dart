abstract class VehicleDto {
  String get vin;
  String get registrationPlate;
  String get make;
  String get model;
  int get year;
  String get colour;
  String get registrationNumber;
  String get expiryDate;
  String get status;
  String get owner;
  String get insuranceExpiry;

  factory VehicleDto.fromJson(Map<String, dynamic> json) {
    return _VehicleDtoImpl(
      vin: json['vin'] ?? '',
      registrationPlate: json['registrationPlate'] ?? '',
      make: json['make'] ?? '',
      model: json['model'] ?? '',
      year: json['year'] ?? 0,
      colour: json['colour'] ?? '',
      registrationNumber: json['registrationNumber'] ?? '',
      expiryDate: json['expiryDate'] ?? '',
      status: json['status'] ?? 'current',
      owner: json['owner'] ?? '',
      insuranceExpiry: json['insuranceExpiry'] ?? '',
    );
  }
}

class _VehicleDtoImpl implements VehicleDto {
  @override
  final String vin;
  @override
  final String registrationPlate;
  @override
  final String make;
  @override
  final String model;
  @override
  final int year;
  @override
  final String colour;
  @override
  final String registrationNumber;
  @override
  final String expiryDate;
  @override
  final String status;
  @override
  final String owner;
  @override
  final String insuranceExpiry;

  _VehicleDtoImpl({
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

  Map<String, dynamic> toJson() => {
        'vin': vin,
        'registrationPlate': registrationPlate,
        'make': make,
        'model': model,
        'year': year,
        'colour': colour,
        'registrationNumber': registrationNumber,
        'expiryDate': expiryDate,
        'status': status,
        'owner': owner,
        'insuranceExpiry': insuranceExpiry,
      };
}