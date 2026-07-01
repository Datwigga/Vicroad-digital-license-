part of 'vehicle_bloc.dart';

abstract class VehicleState extends Equatable {
  const VehicleState();
}

class VehicleInitial extends VehicleState {
  const VehicleInitial();

  @override
  List<Object?> get props => [];
}

class VehicleLoading extends VehicleState {
  const VehicleLoading();

  @override
  List<Object?> get props => [];
}

class VehicleLoaded extends VehicleState {
  final List<Vehicle> vehicles;

  const VehicleLoaded({required this.vehicles});

  @override
  List<Object?> get props => [vehicles];
}

class VehicleSearchResult extends VehicleState {
  final Vehicle vehicle;

  const VehicleSearchResult({required this.vehicle});

  @override
  List<Object?> get props => [vehicle];
}

class VehicleError extends VehicleState {
  final String message;

  const VehicleError({required this.message});

  @override
  List<Object?> get props => [message];
}
