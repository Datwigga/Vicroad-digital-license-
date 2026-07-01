import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digital_license/presentation/bloc/vehicle/vehicle_bloc.dart';
import 'package:digital_license/presentation/widgets/vehicle_card_widget.dart';
import 'package:digital_license/presentation/widgets/status_badge_widget.dart';

class VehicleListScreen extends StatefulWidget {
  const VehicleListScreen({Key? key}) : super(key: key);

  @override
  State<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<VehicleBloc>().add(const FetchVehiclesEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Vehicles'),
      ),
      body: BlocBuilder<VehicleBloc, VehicleState>(
        builder: (context, state) {
          if (state is VehicleLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is VehicleError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is VehicleLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        context.read<VehicleBloc>().add(SearchVehicleEvent(plate: value));
                      } else {
                        context.read<VehicleBloc>().add(const FetchVehiclesEvent());
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Search by plate',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: state.vehicles.length,
                    itemBuilder: (context, index) {
                      final vehicle = state.vehicles[index];
                      return VehicleCardWidget(vehicle: vehicle);
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(child: Text('No vehicles found'));
        },
      ),
    );
  }
}