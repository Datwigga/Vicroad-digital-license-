abstract class DriverLicenseDto {
  String get licenseNumber;
  String get fullName;
  String get dateOfBirth;
  String get expiryDate;
  String get address;
  String get photoUrl;
  String get type;
  List<String> get classes;
  List<String> get conditions;
  String get dateOfIssue;
  bool get isExpired;
  String get state;

  factory DriverLicenseDto.fromJson(Map<String, dynamic> json) {
    return _DriverLicenseDtoImpl(
      licenseNumber: json['licenseNumber'] ?? '',
      fullName: json['fullName'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      expiryDate: json['expiryDate'] ?? '',
      address: json['address'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      type: json['type'] ?? 'full',
      classes: List<String>.from(json['classes'] ?? []),
      conditions: List<String>.from(json['conditions'] ?? []),
      dateOfIssue: json['dateOfIssue'] ?? '',
      isExpired: json['isExpired'] ?? false,
      state: json['state'] ?? 'VIC',
    );
  }
}

class _DriverLicenseDtoImpl implements DriverLicenseDto {
  @override
  final String licenseNumber;
  @override
  final String fullName;
  @override
  final String dateOfBirth;
  @override
  final String expiryDate;
  @override
  final String address;
  @override
  final String photoUrl;
  @override
  final String type;
  @override
  final List<String> classes;
  @override
  final List<String> conditions;
  @override
  final String dateOfIssue;
  @override
  final bool isExpired;
  @override
  final String state;

  _DriverLicenseDtoImpl({
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

  Map<String, dynamic> toJson() => {
        'licenseNumber': licenseNumber,
        'fullName': fullName,
        'dateOfBirth': dateOfBirth,
        'expiryDate': expiryDate,
        'address': address,
        'photoUrl': photoUrl,
        'type': type,
        'classes': classes,
        'conditions': conditions,
        'dateOfIssue': dateOfIssue,
        'isExpired': isExpired,
        'state': state,
      };
}