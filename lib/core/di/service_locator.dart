import 'package:get_it/get_it.dart';
import 'package:digital_license/core/network/api_client.dart';
import 'package:digital_license/data/data_sources/local/local_driver_license_data_source.dart';
import 'package:digital_license/data/data_sources/remote/remote_driver_license_data_source.dart';
import 'package:digital_license/data/data_sources/local/local_vehicle_data_source.dart';
import 'package:digital_license/data/data_sources/remote/remote_vehicle_data_source.dart';
import 'package:digital_license/data/repositories/auth_repository_impl.dart';
import 'package:digital_license/data/repositories/wallet_repository_impl.dart';
import 'package:digital_license/data/repositories/vehicle_repository_impl.dart';
import 'package:digital_license/domain/repositories/auth_repository.dart';
import 'package:digital_license/domain/repositories/wallet_repository.dart';
import 'package:digital_license/domain/repositories/vehicle_repository.dart';
import 'package:digital_license/domain/usecases/auth_usecases.dart';
import 'package:digital_license/domain/usecases/wallet_usecases.dart';
import 'package:digital_license/domain/usecases/vehicle_usecases.dart';
import 'package:digital_license/presentation/bloc/auth/auth_bloc.dart';
import 'package:digital_license/presentation/bloc/wallet/wallet_bloc.dart';
import 'package:digital_license/presentation/bloc/vehicle/vehicle_bloc.dart';
import 'package:digital_license/presentation/bloc/navigation/navigation_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiClient>(ApiClient());
  getIt.registerSingleton<LocalDriverLicenseDataSource>(LocalDriverLicenseDataSourceImpl());
  getIt.registerSingleton<LocalVehicleDataSource>(LocalVehicleDataSourceImpl());
  getIt.registerSingleton<RemoteDriverLicenseDataSource>(RemoteDriverLicenseDataSourceImpl(getIt<ApiClient>()));
  getIt.registerSingleton<RemoteVehicleDataSource>(RemoteVehicleDataSourceImpl(getIt<ApiClient>()));
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<WalletRepository>(WalletRepositoryImpl(remoteDataSource: getIt<RemoteDriverLicenseDataSource>(), localDataSource: getIt<LocalDriverLicenseDataSource>()));
  getIt.registerSingleton<VehicleRepository>(VehicleRepositoryImpl(remoteDataSource: getIt<RemoteVehicleDataSource>(), localDataSource: getIt<LocalVehicleDataSource>()));
  getIt.registerSingleton<AuthUseCases>(AuthUseCases(getIt<AuthRepository>()));
  getIt.registerSingleton<WalletUseCases>(WalletUseCases(getIt<WalletRepository>()));
  getIt.registerSingleton<VehicleUseCases>(VehicleUseCases(getIt<VehicleRepository>()));
  getIt.registerSingleton<AuthBloc>(AuthBloc(getIt<AuthUseCases>()));
  getIt.registerSingleton<WalletBloc>(WalletBloc(getIt<WalletUseCases>()));
  getIt.registerSingleton<VehicleBloc>(VehicleBloc(getIt<VehicleUseCases>()));
  getIt.registerSingleton<NavigationBloc>(NavigationBloc());
}