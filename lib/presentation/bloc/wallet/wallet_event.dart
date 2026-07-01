part of 'wallet_bloc.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();
}

class FetchDriverLicensesEvent extends WalletEvent {
  const FetchDriverLicensesEvent();

  @override
  List<Object?> get props => [];
}

class TogglePrivacyModeEvent extends WalletEvent {
  final bool isPrivate;

  const TogglePrivacyModeEvent({required this.isPrivate});

  @override
  List<Object?> get props => [isPrivate];
}
