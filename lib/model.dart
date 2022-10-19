import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FilterModel {
  final String? type;
  final double? accessibility;
  final int? participants;
  final int? price;
  FilterModel({
    this.type,
    this.accessibility,
    this.participants,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'accessibility': accessibility,
      'participants': participants,
      'price': price,
    };
  }

  FilterModel copyWith({
    String? type,
    double? accessibility,
    int? participants,
    int? price,
  }) {
    return FilterModel(
      type: type ?? this.type,
      accessibility: accessibility ?? this.accessibility,
      participants: participants ?? this.participants,
      price: price ?? this.price,
    );
  }
}

class ActivityModel {
  String? activity;

  ActivityModel({
    this.activity,
  });

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      activity: map['activity'] != null ? map['activity'] as String : null,
    );
  }

  factory ActivityModel.fromJson(String source) =>
      ActivityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
