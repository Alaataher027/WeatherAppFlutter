import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_flutter_app/models/hourly_weather_model.dart';
import 'package:weather_flutter_app/models/weather_model.dart';

class WeatherService {
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "4883f949c6ad4a289a622710250501";

  final Dio dio;
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      // ال dio  بتتشك لوحدها على ال كود بتاع ال http اذا كان 200 ولا لا
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? "There was an error!";
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Try later!");
    }
  }

  Future<List<HourlyWeatherModel>> getHourlyWeather(String cityName) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1",
      );

      List hourlyData = response.data['forecast']['forecastday'][0]['hour'];
      return hourlyData
          .map((hour) => HourlyWeatherModel.fromJson(hour))
          .toList();
    } catch (e) {
      throw Exception("Error fetching hourly weather: $e");
    }
  }
}
