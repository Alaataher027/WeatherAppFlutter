import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_flutter_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_flutter_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeView(),
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              //print weatherCondition
              // builder: (context, _) {
              //   print(
              //       'Weather Condition: ${BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition}');
              //   return _!;
              // },
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.grey;
  }

  // Normalize the input: Trim whitespace and make lowercase
  String normalizedCondition = condition.trim().toLowerCase();

  SunnyMaterialColor sunnyMaterial = SunnyMaterialColor(
    0xFFF98240,
    const <int, Color>{
      50: Color(0xFFFFF3E0),
      100: Color(0xFFFFE0B2),
      200: Color(0xFFFFCC80),
      300: Color(0xFFFFB74D),
      400: Color(0xFFFFA726),
      500: Color(0xFFF98240), // Primary color
      600: Color(0xFFFB8C00),
      700: Color(0xFFF57C00),
      800: Color(0xFFEF6C00),
      900: Color(0xFFE65100),
    },
  );
  switch (normalizedCondition) {
    case "sunny":
      // return Colors.orange;
      return sunnyMaterial;
    case "partly cloudy":
      return Colors.blueGrey;
    case "cloudy":
    case "overcast":
      return Colors.blueGrey;
    case "mist":
      return Colors.teal;
    case "patchy rain possible":
    case "patchy rain nearby":
    case "light rain":
    case "moderate rain":
    case "heavy rain":
      return Colors.blue;
    case "patchy snow possible":
    case "light snow":
    case "moderate snow":
    case "heavy snow":
      return Colors.lightBlue;
    case "thundery outbreaks possible":
      return Colors.deepPurple;
    case "fog":
      return Colors.brown;
    default:
      return Colors.blue; // Fallback color
  }
}

String getWeatherIcon(String condition, int isDay) {
  String normalizedCondition = condition.trim().toLowerCase();

  switch (isDay) {
    case 1:
      switch (normalizedCondition) {
        case "sunny":
          return "assets/images/sunny.svg";
        case "partly cloudy":
          return "assets/images/cloudy_partly.svg";
        case "fog":
        case "mist":
          return "assets/images/cloudy_fog.svg";
        case "cloudy":
        case "overcast":
          return "assets/images/cloudy.svg";
        case "patchy rain possible":
        case "light rain":
        case "light drizzle":
        case "moderate rain":
        case "patchy rain nearby":
        case "heavy rain":
          return "assets/images/rain.svg";
        case "patchy snow possible":
        case "light snow":
        case "moderate snow":
        case "heavy snow":
          return "assets/images/snowy.svg";
        case "thundery outbreaks possible":
          return "assets/images/thunder.svg";
        default:
          return "assets/images/cloudy.svg"; // Default icon
      }
    case 0:
      switch (normalizedCondition) {
        case "clear":
          return "assets/images/night.svg";
        case "partly cloudy":
          return "assets/images/cloudy_fog.svg";
        case "fog":
        case "mist":
          return "assets/images/cloudy_fog.svg";
        case "cloudy":
        case "overcast":
          return "assets/images/cloudy_fog.svg";
        case "patchy rain possible":
        case "light rain":
        case "light drizzle":
        case "moderate rain":
        case "patchy rain nearby":
        case "heavy rain":
          return "assets/images/rain.svg";
        case "patchy snow possible":
        case "light snow":
        case "moderate snow":
        case "heavy snow":
          return "assets/images/snowy.svg";
        case "thundery outbreaks possible":
          return "assets/images/thunder.svg";
        default:
          return "assets/images/night.svg"; // Default icon
      }
    default:
      return "assets/images/cloudy.svg"; // Default icon
  }
}

String getHourlyWeatherIcon(String condition) {
  String normalizedCondition = condition.trim().toLowerCase();

  switch (normalizedCondition) {
    case "clear":
      return "assets/images/night.svg";
    case "sunny":
      return "assets/images/sunny.svg";
    case "partly cloudy":
      return "assets/images/cloudy_partly.svg";
    case "fog":
    case "mist":
      return "assets/images/cloudy_fog.svg";
    case "cloudy":
    case "overcast":
      return "assets/images/cloudy.svg";
    case "patchy rain possible":
    case "light rain":
    case "light drizzle":
    case "moderate rain":
    case "patchy rain nearby":
    case "heavy rain":
      return "assets/images/rain.svg";
    case "patchy snow possible":
    case "light snow":
    case "moderate snow":
    case "heavy snow":
      return "assets/images/snowy.svg";
    case "thundery outbreaks possible":
      return "assets/images/thunder.svg";
    default:
      return "assets/images/cloudy.svg"; // Default icon
  }
}

class SunnyMaterialColor extends MaterialColor {
  SunnyMaterialColor(super.primary, super.swatch);
}
