import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_flutter_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.5,
        title: Text(
          "Search",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 90, left: 16, right: 16),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/images/map.svg", width: 170, // Set the desired width
              height: 170, // Set the desired height
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onSubmitted: (value) async {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context);

                // log(weatherModel!.cityName);
              },
              // onChanged: (value) { // لو انا عايزة اتتبع اللى بيكتبه
              //   log(value);
              // },
              // enabled: false,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25, horizontal: 12),
                labelText: "Search  ",
                hintText: "Enter the city name",
                hintStyle:
                    TextStyle(color: const Color.fromARGB(255, 177, 177, 177)),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(16.0),
                //   ),
                //   borderSide: BorderSide(color: Colors.orange),
                // ),
                // focusedBorder: OutlineInputBorder()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
