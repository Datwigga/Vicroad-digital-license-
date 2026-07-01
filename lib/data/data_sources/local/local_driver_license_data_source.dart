abstract class LocalDriverLicenseDataSource {
  Future<List<dynamic>> fetchCachedLicenses();
  Future<void> cacheLicenses(List<dynamic> licenses);
}

class LocalDriverLicenseDataSourceImpl implements LocalDriverLicenseDataSource {
  @override
  Future<List<dynamic>> fetchCachedLicenses() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [];
  }

  @override
  Future<void> cacheLicenses(List<dynamic> licenses) async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}