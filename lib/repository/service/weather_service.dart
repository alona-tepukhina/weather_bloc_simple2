import 'package:weather_bloc_simple2/repository/models/current_weather.dart';
import 'package:weather_bloc_simple2/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  Future<CurrentWeather?> getData(String request) async {
    var queryParams = {
      'appid': dotenv.get('API_KEY'),
      'units': 'metric',
      'q': request,
    };

    //NetworkRequest('$url?q=$cityName&appid=$kWeatherApiKey&units=metric');

    var uri = Uri.https(authority, currentWeatherPath, queryParams);
    // var uri = Uri.https(authority, path, queryParams);
    final client = http.Client();
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      var decodedData = CurrentWeather.fromJson(jsonDecode(response.body));
      return decodedData;
    }
    print('error with API');
    return null;
  }
}
