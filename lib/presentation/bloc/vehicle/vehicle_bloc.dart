import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:digital_license/domain/entities/vehicle.dart';
import 'package:digital_license/domain/usecases/vehicle_usecases.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleUseCases vehicleUseCases;

  VehicleBloc(this.vehicleUseCases) : super(const VehicleInitial()) {
    on<FetchVehiclesEvent>(_onFetchVehicles);
    on<SearchVehicleEvent>(_onSearchVehicle);
  }

  Future<void> _onFetchVehicles(FetchVehiclesEvent event, Emitter<VehicleState> emit) async {
    emit(const VehicleLoading());
    try {
      final vehicles = await vehicleUseCases.fetchVehicles();
      emit(VehicleLoaded(vehicles: vehicles));
    } catch (e) {
      emit(VehicleError(message: e.toString()));
    }
  }

  Future<void> _onSearchVehicle(SearchVehicleEvent event, Emitter<VehicleState> emit) async {
    emit(const VehicleLoading());
    try {
      final vehicle = await vehicleUseCases.searchVehicleByPlate(event.plate);
      emit(VehicleSearchResult(vehicle: vehicle));
    } catch (e) {
      emit(VehicleError(message: 'Vehicle not found'));
    }
  }
}
