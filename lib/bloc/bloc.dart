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
    emit(state.copyWith(filterModel: FilterModel()));
  }

  Future<void> _submit(
      RandomSubmitEvent event, Emitter<RandomState> emit) async {
    emit(state.copyWith(status: RandomStateStatus.loading));
    ActivityModel? result;
    if (state.filterModel?.type == null &&
        state.filterModel?.accessibility == null &&
        state.filterModel?.participants == null &&
        state.filterModel?.price == null) {
      result = await randomRepository.getActivity();
    } else {
      result = await randomRepository.getActivityWithFilters(
          model: state.filterModel);
    }

    if (result != null) {
      emit(
        state.copyWith(
            status: RandomStateStatus.loadedSuccess, activityModel: result),
      );
    } else {
      emit(state.copyWith(status: RandomStateStatus.loadedError));
    }
  }

  static RandomState initialState() => RandomState(
      status: RandomStateStatus.initial, filterModel: FilterModel());
}
