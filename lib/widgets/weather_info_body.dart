import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_flutter_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_flutter_app/main.dart';
import 'package:weather_flutter_app/models/weather_model.dart';
import 'package:weather_flutter_app/widgets/details_widget.dart';
import 'package:weather_flutter_app/widgets/hourly_weather_cards.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[100]!,
            getThemeColor(weatherModel.weatherCondition)[50]!
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    weatherModel.cityName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Last update, ${weatherModel.date.hour}:${weatherModel.date.minute}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0), // Add padding from the top
                        child: Text(
                          "${weatherModel.temp.round()}°C",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 110,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 0, left: 80),
                        child: SvgPicture.asset(
                          getWeatherIcon(weatherModel.weatherCondition,
                              weatherModel.isDay), // Dynamic SVG
                          width: 240, // Set the desired width
                          height: 240, // Set the desired height
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  DetailsWidget(),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    weatherModel.weatherCondition,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: const Color.fromARGB(173, 1, 3, 7)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  HourlyWeatherCards(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
