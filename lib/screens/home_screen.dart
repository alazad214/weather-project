import 'package:flutter/material.dart';

import 'package:weather_project/models/weather_model.dart';
import 'package:weather_project/servies/weather_servies.dart';
import 'package:weather_project/utils/colors.dart';
import 'package:weather_project/widgets/hour_weather_list.dart';
import 'package:weather_project/widgets/news_card.dart';

import 'package:weather_project/widgets/todays_weather.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchcontroller = TextEditingController();
  final searchText = "auto:ip";

  _searchDialog(
    BuildContext context,
  ) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(

            title: Text("Search Location"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("আমার আবহাওয়া"),
        backgroundColor: AppColors.denim_,
        titleSpacing: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.my_location)),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: FutureBuilder(
            future: WeatherServies().weatherModelServies(searchText),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                WeatherModel? weatherModel = snapshot.data;

                if (snapshot.hasError) {
                  return const Center(child: Text("Something Wrong"));
                }

                return SizedBox(
                  child: Column(
                    children: [
                      TodaysWeather(weatherModel: weatherModel),
                      const SizedBox(height: 15),
                      const Text(
                        "প্রতি ঘন্টার আবহাওয়া",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 15),
                      HourWeatherList(
                        weatherModel: weatherModel,
                      ),
                      const SizedBox(height: 15),
                      const NewsCard()
                    ],
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            }),
      )),
      drawer: CustomDrawer(),
    );
  }
}
