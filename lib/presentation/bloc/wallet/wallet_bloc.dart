import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:digital_license/domain/entities/driver_license.dart';
import 'package:digital_license/domain/usecases/wallet_usecases.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletUseCases walletUseCases;
  bool _isPrivacyMode = false;

  WalletBloc(this.walletUseCases) : super(const WalletInitial()) {
    on<FetchDriverLicensesEvent>(_onFetchLicenses);
    on<TogglePrivacyModeEvent>(_onTogglePrivacy);
  }

  Future<void> _onFetchLicenses(FetchDriverLicensesEvent event, Emitter<WalletState> emit) async {
    emit(const WalletLoading());
    try {
      final licenses = await walletUseCases.fetchDriverLicenses();
      emit(WalletLoaded(licenses: licenses, isPrivacyMode: _isPrivacyMode));
    } catch (e) {
      emit(WalletError(message: e.toString()));
    }
  }

  Future<void> _onTogglePrivacy(TogglePrivacyModeEvent event, Emitter<WalletState> emit) async {
    _isPrivacyMode = event.isPrivate;
    if (state is WalletLoaded) {
      final loaded = state as WalletLoaded;
      emit(WalletLoaded(licenses: loaded.licenses, isPrivacyMode: _isPrivacyMode));
    }
  }
}
