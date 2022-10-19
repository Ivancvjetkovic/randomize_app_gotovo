// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';

import 'package:http/http.dart';
import 'package:randomize_app/config.dart';
import 'package:randomize_app/model.dart';

class HttpService {
  Future<ActivityModel> getActivity() async {
    Response res = await get(Uri.http(baseApi, endPoint));
    print(res.body.toString());
    var body = jsonDecode(res.body);
    ActivityModel activity = ActivityModel.fromMap(body);
    return activity;
  }
  Future<ActivityModel> getActivityWithFilters({FilterModel? model}) async {
    Response res = await get(
      Uri.http(
        baseApi,
        endPoint,
        {
          if (model?.type != null) 'type': '${model?.type}',
          if (model?.price != null) 'price': '${model?.price}',
          if (model?.accessibility != null)
            'accessibility': '${model?.accessibility}',
          if (model?.participants != null)
            'participants': '${model?.participants}',
        },
      ),
    );
    print(res.body.toString());
    var body = jsonDecode(res.body);
    ActivityModel activity = ActivityModel.fromMap(body);
    return activity;
  }
}