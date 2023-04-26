import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_simple2/bloc/weather_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Search text'),
      textInputAction: TextInputAction.search,
      onFieldSubmitted: onSearch,
    );
  }

  void onSearch(String request) {
    BlocProvider.of<WeatherBloc>(context)
      ..add(WeatherSearchEvent())
      ..add(WeatherLoadEvent(request: request));
  }
}
