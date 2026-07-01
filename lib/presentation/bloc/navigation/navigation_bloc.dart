import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial()) {
    on<ChangeTabEvent>(_onChangeTab);
  }

  Future<void> _onChangeTab(ChangeTabEvent event, Emitter<NavigationState> emit) async {
    emit(TabChanged(currentTab: event.tabIndex));
  }
}
