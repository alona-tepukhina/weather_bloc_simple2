import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_simple2/repository/weather_repository.dart';

import 'package:weather_bloc_simple2/repository/models/models.dart';

// import 'package:weather_bloc_simple2/repository/models/current_weather.dart';
// import 'package:weather_bloc_simple2/repository/service/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.weatherRepository,
  }) : super(WeatherInitial()) {
    on<WeatherSearchEvent>(onWeatherSearchEvent);
    on<WeatherLoadEvent>(onWeatherLoadEvent);
  }

  final WeatherRepository weatherRepository;

  void onWeatherSearchEvent(
      WeatherSearchEvent event, Emitter<WeatherState> emit) {
    emit(WeatherSearchState());
  }

  Future<void> onWeatherLoadEvent(
    WeatherLoadEvent event,
    Emitter<WeatherState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    // final result = await WeatherService().getWeatherData(event.request);
    final result = await weatherRepository.getWeatherData(event.request);
    emit(WeatherLoadedState(data: result));
  }
}

// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   WeatherBloc() : super(WeatherInitial()) {
//     on<WeatherSearchEvent>(onWeatherSearchEvent);
//     on<WeatherLoadEvent>(onWeatherLoadEvent);
//   }
//
//   void onWeatherSearchEvent(
//       WeatherSearchEvent event, Emitter<WeatherState> emit) {
//     emit(WeatherSearchState());
//   }
//
//   Future<void> onWeatherLoadEvent(
//     WeatherLoadEvent event,
//     Emitter<WeatherState> emit,
//   ) async {
//     final result = await WeatherService().getWeatherData(event.request);
//     emit(WeatherLoadedState(data: result));
//   }
// }
