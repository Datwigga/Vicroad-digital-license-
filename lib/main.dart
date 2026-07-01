import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:digital_license/core/di/service_locator.dart';
import 'package:digital_license/presentation/pages/splash_screen.dart';
import 'package:digital_license/presentation/theme/app_theme.dart';
import 'package:digital_license/presentation/bloc/auth/auth_bloc.dart';
import 'package:digital_license/presentation/bloc/wallet/wallet_bloc.dart';
import 'package:digital_license/presentation/bloc/vehicle/vehicle_bloc.dart';
import 'package:digital_license/presentation/bloc/navigation/navigation_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Wallet',
      theme: AppTheme.lightTheme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<AuthBloc>()),
          BlocProvider(create: (_) => getIt<WalletBloc>()),
          BlocProvider(create: (_) => getIt<VehicleBloc>()),
          BlocProvider(create: (_) => getIt<NavigationBloc>()),
        ],
        child: const SplashScreen(),
      ),
    );
  }
}