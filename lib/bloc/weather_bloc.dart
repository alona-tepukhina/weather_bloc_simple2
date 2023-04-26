import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_bloc_simple2/data/model.dart';
import 'package:weather_bloc_simple2/data/data_source.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherSearchEvent>(onWeatherSearchEvent);
    on<WeatherLoadEvent>(onWeatherLoadEvent);
  }

  void onWeatherSearchEvent(
      WeatherSearchEvent event, Emitter<WeatherState> emit) {
    emit(WeatherSearchState());
  }

  Future<void> onWeatherLoadEvent(
    WeatherLoadEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final result = await DataSource().getData(event.request);
    if (result != null) {
      emit(WeatherLoadedState(data: result));
    }
  }
}
