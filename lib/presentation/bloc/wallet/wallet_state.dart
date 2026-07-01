part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  const WalletState();
}

class WalletInitial extends WalletState {
  const WalletInitial();

  @override
  List<Object?> get props => [];
}

class WalletLoading extends WalletState {
  const WalletLoading();

  @override
  List<Object?> get props => [];
}

class WalletLoaded extends WalletState {
  final List<DriverLicense> licenses;
  final bool isPrivacyMode;

  const WalletLoaded({required this.licenses, required this.isPrivacyMode});

  @override
  List<Object?> get props => [licenses, isPrivacyMode];
}

class WalletError extends WalletState {
  final String message;

  const WalletError({required this.message});

  @override
  List<Object?> get props => [message];
}
