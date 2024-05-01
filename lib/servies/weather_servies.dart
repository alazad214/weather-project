import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_project/utils/url_utils.dart';

import '../models/weather_model.dart';

class WeatherServies {
  Future<WeatherModel> weatherModelServies(String searchText) async {
    String url = "$base_url&q=$searchText&days=1";

    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        WeatherModel weatherModel = WeatherModel.fromJson(json);
        return weatherModel;
      } else {
        throw "No Data";
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
