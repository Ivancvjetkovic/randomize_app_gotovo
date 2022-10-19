import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomize_app/bloc/bloc_event.dart';
import 'package:randomize_app/bloc/bloc_state.dart';
import 'package:randomize_app/http_service.dart';
import 'package:randomize_app/model.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  final HttpService randomRepository;

  RandomBloc({required this.randomRepository}) : super(initialState()) {
    on<RandomUpdateEvent>(_update);
    on<RandomSubmitEvent>(_submit);
    on<RandomResetEvent>(_reset);
  }

  Future<void> _update(
      RandomUpdateEvent event, Emitter<RandomState> emit) async {
    emit(state.copyWith(filterModel: event.model));
  }

  Future<void> _reset(RandomResetEvent event, Emitter<RandomState> emit) async {
    emit(state.copyWith(filterModel: null));
  }

  Future<void> _submit(
      RandomSubmitEvent event, Emitter<RandomState> emit) async {
    emit(state.copyWith(status: RandomStateStatus.loading));
    ActivityModel? result;
    if (state.filterModel != null) {
      result = await randomRepository.getActivityWithFilters(
          model: state.filterModel);
    } else {
      result = await randomRepository.getActivity();
    }

    if (result != null) {
      emit(
        state.copyWith(
            status: RandomStateStatus.loadedSuccess, activityModel: result),
      );
    } else {
      emit(state.copyWith(status: RandomStateStatus.initial));
    }
  }

  static RandomState initialState() =>
      RandomState(status: RandomStateStatus.initial);
}
