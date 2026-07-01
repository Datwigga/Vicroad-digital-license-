import 'package:digital_license/data/models/driver_license_dto.dart';
import 'package:digital_license/domain/entities/driver_license.dart';

class DriverLicenseMapper {
  static DriverLicense toDomain(DriverLicenseDto dto) {
    return DriverLicense(
      licenseNumber: dto.licenseNumber,
      fullName: dto.fullName,
      dateOfBirth: dto.dateOfBirth,
      expiryDate: dto.expiryDate,
      address: dto.address,
      photoUrl: dto.photoUrl,
      type: _mapType(dto.type),
      classes: _mapClasses(dto.classes),
      conditions: dto.conditions,
      dateOfIssue: dto.dateOfIssue,
      isExpired: dto.isExpired,
      state: dto.state,
    );
  }

  static LicenseType _mapType(String type) {
    switch (type.toLowerCase()) {
      case 'probationary':
        return LicenseType.probationary;
      case 'learner':
        return LicenseType.learner;
      default:
        return LicenseType.full;
    }
  }

  static List<LicenseClass> _mapClasses(List<String> classes) {
    return classes.map((c) {
      switch (c.toLowerCase()) {
        case 'class_e':
          return LicenseClass.classE;
        case 'class_lr':
          return LicenseClass.classLR;
        case 'class_hr':
          return LicenseClass.classHR;
        default:
          return LicenseClass.classC;
      }
    }).toList();
  }
}