import 'package:weather_bloc_simple2/repository/models/models.dart';
import 'package:weather_bloc_simple2/repository/service/weather_service.dart';

class WeatherRepository {
  const WeatherRepository({required this.service});

  final WeatherService service;
}
