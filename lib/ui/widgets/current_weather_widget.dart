import 'package:flutter/material.dart';
import 'package:weather_bloc_simple2/data/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_simple2/bloc/weather_bloc.dart';

class CurrentWeatherWidget extends StatefulWidget {
  const CurrentWeatherWidget({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherWidget> createState() => _CurrentWeatherWidgetState();
}

class _CurrentWeatherWidgetState extends State<CurrentWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    // String? city;
    // int? conditionCode;
    // String? weatherMessage;
    // double? windSpeed;
    // double? temperature;

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          CurrentWeather currentWeather = state.data;
          return Column(
            children: [
              Text(
                currentWeather.city ?? '',
                style: const TextStyle(fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${currentWeather.temperature?.round()}°C ',
                    style: const TextStyle(fontSize: 96),
                  ),
                ],
              ),
              Text(
                currentWeather.weatherMessage ?? '',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                'Wind speed ${currentWeather.windSpeed} m/s',
                style: const TextStyle(fontSize: 24),
              ),
            ],
          );
        }
        if (state is WeatherSearchState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column();
      },
    );
  }

  // void onSearch(String request) {
  //   BlocProvider.of<WeatherBloc>(context)
  //     ..add(WeatherSearchEvent())
  //     ..add(WeatherLoadEvent(request: request));
  // }
}
