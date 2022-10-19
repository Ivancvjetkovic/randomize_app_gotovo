// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:randomize_app/model.dart';

enum RandomStateStatus { initial, loading, loadedSuccess, loadedError }

class RandomState {
  RandomStateStatus? status;
  ActivityModel? activityModel;
  FilterModel? filterModel;
  RandomState({this.status, this.activityModel, this.filterModel});

  RandomState copyWith(
      {RandomStateStatus? status,
      ActivityModel? activityModel,
      FilterModel? filterModel}) {
    return RandomState(
        status: status ?? this.status,
        activityModel: activityModel ?? this.activityModel,
        filterModel: filterModel ?? this.filterModel);
  }
}
