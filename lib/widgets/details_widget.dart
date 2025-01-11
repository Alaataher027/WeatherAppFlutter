import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_flutter_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_flutter_app/models/weather_model.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(122, 255, 255, 255),
        borderRadius: BorderRadius.circular(8), //  Rounded corners
      ),
      padding: const EdgeInsets.all(8.0), // Padding inside the border
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Optional alignment
        children: [
          Column(
            children: [
              Text(
                'Maxtemp',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "assets/images/temp_max.svg", // Dynamic SVG
                width: 15, // Set the desired width
                height: 15, // Set the desired height
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${weatherModel.maxTemp.round()}°C")
            ],
          ),
          Column(
            children: [
              Text(
                'Humidity',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "assets/images/humidity.svg", // Dynamic SVG
                width: 15, // Set the desired width
                height: 15, // Set the desired height
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${weatherModel.humidity}%")
            ],
          ),
          Column(
            children: [
              Text(
                'Wind K/P',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "assets/images/wind.svg", // Dynamic SVG
                width: 20, // Set the desired width
                height: 20, // Set the desired height
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${weatherModel.windKPH.round()}")
            ],
          ),
          Column(
            children: [
              Text(
                'Mintemp',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "assets/images/temp_min.svg", // Dynamic SVG
                width: 15, // Set the desired width
                height: 15, // Set the desired height
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${weatherModel.minTemp.round()}°C")
            ],
          ),
        ],
      ),
    );
  }
}
