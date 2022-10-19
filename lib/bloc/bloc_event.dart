// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:randomize_app/model.dart';

abstract class RandomEvent {}

class RandomUpdateEvent extends RandomEvent {
  FilterModel model;
  RandomUpdateEvent({
    required this.model,
  });
}
class RandomResetEvent extends RandomEvent{}
class RandomSubmitEvent extends RandomEvent {}
