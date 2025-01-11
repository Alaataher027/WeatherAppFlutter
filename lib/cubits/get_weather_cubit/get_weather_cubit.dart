import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_flutter_app/models/hourly_weather_model.dart';
import 'package:weather_flutter_app/models/weather_model.dart';
import 'package:weather_flutter_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  List<HourlyWeatherModel>? hourlyWeatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      hourlyWeatherModel =
          await WeatherService(Dio()).getHourlyWeather(cityName);

      // emit(state);
      emit(WeatherLoadedState(weatherModel!, hourlyWeatherModel!));
    } catch (e) {
      emit(
        WeatherFailerState(e.toString()),
      );
    }
  }
}
