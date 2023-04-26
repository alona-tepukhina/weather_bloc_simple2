import 'package:flutter/material.dart';
import 'package:weather_bloc_simple2/ui/widgets/current_weather_widget.dart';
import 'package:weather_bloc_simple2/ui/widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SearchWidget(),
          SizedBox(height: 24),
          Expanded(
            child: CurrentWeatherWidget(),
          ),
        ],
      ),
    );
  }
}
