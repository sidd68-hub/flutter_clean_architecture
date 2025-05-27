import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/domain/entities/home_user_entities.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/domain/use_case/home_screen_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeScreenUseCase homeScreenUseCase;

  HomeBloc(this.homeScreenUseCase) : super(HomeState()) {
    on<InitialApiEvent>(_onInitialApiCall);
    add(InitialApiEvent());
  }

  Future<void> _onInitialApiCall(
      InitialApiEvent event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(isLoading: true,));

    final result = await homeScreenUseCase(page: 1);

    result.when(
      success: (users) {
        emit(state.copyWith(isLoading: false, user: users,));
      },
      failure: (message, code) {
        print("The Message is $message and code is $code");
        emit(state.copyWith(isLoading: false));
      },
    );
  }

}
