import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_flutter_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_flutter_app/views/search_view.dart';
import 'package:weather_flutter_app/widgets/error_widget.dart';
import 'package:weather_flutter_app/widgets/no_weather_body.dart';
import 'package:weather_flutter_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: const Text(
          'Weather',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody();
          } else {
            return FailureStateWidget(
              errorMessage: 'Please search again.',
            );
          }
        },
      ),
    );
  }
}
