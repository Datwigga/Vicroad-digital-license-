part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();
}

class NavigationInitial extends NavigationState {
  const NavigationInitial();

  @override
  List<Object?> get props => [];
}

class TabChanged extends NavigationState {
  final int currentTab;

  const TabChanged({required this.currentTab});

  @override
  List<Object?> get props => [currentTab];
}
