import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_flutter_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_flutter_app/main.dart';
import 'package:weather_flutter_app/models/hourly_weather_model.dart';

class HourlyWeatherCards extends StatelessWidget {
  const HourlyWeatherCards({super.key});

  @override
  Widget build(BuildContext context) {
    List<HourlyWeatherModel> hourlyWeatherModel =
        BlocProvider.of<GetWeatherCubit>(context).hourlyWeatherModel!;

    return SizedBox(
      height: 150, // Height of the scrollable cards
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeatherModel.length,
        itemBuilder: (context, index) {
          var hour = hourlyWeatherModel[index];
          return Card(
            color: Colors.transparent,
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(hour.time.split(' ')[1], // Display time (HH:mm)
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  SvgPicture.asset(
                    getHourlyWeatherIcon(
                      hourlyWeatherModel[index].weatherCondition,
                    ), // Dynamic SVG
                    width: 60, // Set the desired width
                    height: 60, // Set the desired height
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "${hour.tempC}°C",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class HourlyWeatherCards extends StatefulWidget {
//   final String cityName;

//   const HourlyWeatherCards({required this.cityName, super.key});

//   @override
//   _HourlyWeatherCardsState createState() => _HourlyWeatherCardsState();
// }

// class _HourlyWeatherCardsState extends State<HourlyWeatherCards> {
//   late WeatherService hourlyWeatherService;
//   List<HourlyWeatherModel> hourlyWeather = [];
//   bool isLoading = true;
//   String? errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     hourlyWeatherService = WeatherService(Dio());
//     fetchHourlyWeather();
//   }

//   Future<void> fetchHourlyWeather() async {
//     try {
//       List<HourlyWeatherModel> data =
//           await hourlyWeatherService.getHourlyWeather(widget.cityName);
//       setState(() {
//         hourlyWeather = data;
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         errorMessage = e.toString();
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (errorMessage != null) {
//       return Center(child: Text(errorMessage!));
//     }

//     return SizedBox(
//       height: 130, // Height of the scrollable cards
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: hourlyWeather.length,
//         itemBuilder: (context, index) {
//           var hour = hourlyWeather[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(hour.time.split(' ')[1], // Display time (HH:mm)
//                       style: const TextStyle(fontSize: 16)),
//                   const SizedBox(height: 8),
//                   Text(
//                     "${hour.tempC}°C",
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
