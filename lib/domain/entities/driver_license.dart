import 'package:equatable/equatable.dart';

enum LicenseType { probationary, full, learner }
enum LicenseClass { classC, classE, classLR, classHR }

class DriverLicense extends Equatable {
  final String licenseNumber;
  final String fullName;
  final String dateOfBirth;
  final String expiryDate;
  final String address;
  final String photoUrl;
  final LicenseType type;
  final List<LicenseClass> classes;
  final List<String> conditions;
  final String dateOfIssue;
  final bool isExpired;
  final String state;

  const DriverLicense({
    required this.licenseNumber,
    required this.fullName,
    required this.dateOfBirth,
    required this.expiryDate,
    required this.address,
    required this.photoUrl,
    required this.type,
    required this.classes,
    required this.conditions,
    required this.dateOfIssue,
    required this.isExpired,
    required this.state,
  });

  @override
  List<Object?> get props => [licenseNumber, fullName, dateOfBirth, expiryDate, address, photoUrl, type, classes, conditions, dateOfIssue, isExpired, state];
}