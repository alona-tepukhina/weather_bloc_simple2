part of 'weather_bloc.dart';

// @immutable
abstract class WeatherEvent {}

class WeatherInitEvent extends WeatherEvent {}

class WeatherSearchEvent extends WeatherEvent {}

class WeatherLoadEvent extends WeatherEvent {
  WeatherLoadEvent({required this.request});
  final String request;
}
