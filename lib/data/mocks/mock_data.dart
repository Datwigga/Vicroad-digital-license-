import 'package:digital_license/domain/entities/driver_license.dart';
import 'package:digital_license/domain/entities/vehicle.dart';

class MockData {
  static List<DriverLicense> generateDriverLicenses() {
    return [
      DriverLicense(
        licenseNumber: 'VIC123456',
        fullName: 'John Alexander Smith',
        dateOfBirth: '1985-03-15',
        expiryDate: '2027-03-15',
        address: '123 Oak Street, Melbourne VIC 3000',
        photoUrl: 'https://via.placeholder.com/200?text=JAS',
        type: LicenseType.full,
        classes: [LicenseClass.classC],
        conditions: ['Vision correction required', 'Daylight driving only'],
        dateOfIssue: '2024-03-15',
        isExpired: false,
        state: 'VIC',
      ),
    ];
  }

  static List<Vehicle> generateVehicles() {
    return [
      Vehicle(
        vin: 'WVWZZZ3CZ9E000001',
        registrationPlate: 'ABC123',
        make: 'Volkswagen',
        model: 'Golf GTI',
        year: 2022,
        colour: 'Pearl White',
        registrationNumber: 'VIC-2022-001',
        expiryDate: '2025-03-31',
        status: RegistrationStatus.current,
        owner: 'John Alexander Smith',
        insuranceExpiry: '2025-06-15',
      ),
      Vehicle(
        vin: 'JTHBP5C23A5034920',
        registrationPlate: 'XYZ789',
        make: 'Toyota',
        model: 'Corolla',
        year: 2020,
        colour: 'Graphite',
        registrationNumber: 'VIC-2020-045',
        expiryDate: '2025-04-15',
        status: RegistrationStatus.dueSoon,
        owner: 'John Alexander Smith',
        insuranceExpiry: '2025-08-20',
      ),
    ];
  }
}