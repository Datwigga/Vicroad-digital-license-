part of 'vehicle_bloc.dart';

abstract class VehicleEvent extends Equatable {
  const VehicleEvent();
}

class FetchVehiclesEvent extends VehicleEvent {
  const FetchVehiclesEvent();

  @override
  List<Object?> get props => [];
}

class SearchVehicleEvent extends VehicleEvent {
  final String plate;

  const SearchVehicleEvent({required this.plate});

  @override
  List<Object?> get props => [plate];
}
