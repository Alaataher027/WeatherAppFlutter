import 'package:weather_flutter_app/models/hourly_weather_model.dart';
import 'package:weather_flutter_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  final List<HourlyWeatherModel> hourlyWeatherModel;

  WeatherLoadedState(this.weatherModel, this.hourlyWeatherModel);
}

class WeatherFailerState extends WeatherState {
  final String errMessage;

  WeatherFailerState(this.errMessage);
}
