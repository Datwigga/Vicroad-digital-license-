abstract class LocalVehicleDataSource {
  Future<List<dynamic>> fetchCachedVehicles();
  Future<void> cacheVehicles(List<dynamic> vehicles);
}

class LocalVehicleDataSourceImpl implements LocalVehicleDataSource {
  @override
  Future<List<dynamic>> fetchCachedVehicles() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [];
  }

  @override
  Future<void> cacheVehicles(List<dynamic> vehicles) async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}