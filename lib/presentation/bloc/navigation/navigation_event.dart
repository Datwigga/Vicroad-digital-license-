part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class ChangeTabEvent extends NavigationEvent {
  final int tabIndex;

  const ChangeTabEvent({required this.tabIndex});

  @override
  List<Object?> get props => [tabIndex];
}
