import 'dart:io';

import 'package:weather_bloc_simple2/repository/models/current_weather.dart';
import 'package:weather_bloc_simple2/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  WeatherService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  Future<CurrentWeather> getWeatherData(String request) async {
    var queryParams = {
      'appid': dotenv.get('API_KEY'),
      'units': 'metric',
      'q': request,
    };

    //NetworkRequest('$url?q=$cityName&appid=$kWeatherApiKey&units=metric');

    var uri = Uri.https(authority, currentWeatherPath, queryParams);

    final response = await _httpClient.get(uri);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return CurrentWeather.fromJson(jsonDecode(response.body));
      }
      throw const FormatException('Empty response');
    }
    throw Exception('API troubles, status code: ${response.statusCode}');
  }
}
