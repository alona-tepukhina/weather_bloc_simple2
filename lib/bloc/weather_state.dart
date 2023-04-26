part of 'weather_bloc.dart';

// @immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherSearchState extends WeatherState {}

class WeatherLoadedState implements WeatherState {
  WeatherLoadedState({required this.data});

  final CurrentWeather data;
}
