import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_simple2/bloc/weather_bloc.dart';
import 'package:weather_bloc_simple2/ui/homepage.dart';
import 'package:weather_bloc_simple2/repository/weather_repository.dart';
import 'package:weather_bloc_simple2/repository/service/weather_service.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current weather'),
        centerTitle: true,
      ),
      body: RepositoryProvider(
        create: (context) => WeatherRepository(service: WeatherService()),
        child: BlocProvider<WeatherBloc>(
          create: (context) =>
              WeatherBloc(weatherRepository: context.read<WeatherRepository>()),
          child: const HomePage(),
        ),
      ),
    );
  }
}
