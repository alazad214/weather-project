import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_project/models/weather_model.dart';
import 'package:weather_project/servies/weather_servies.dart';
import 'package:weather_project/utils/colors.dart';
import 'package:weather_project/widgets/hour_weather_list.dart';
import 'package:weather_project/widgets/seven_days_weather.dart';
import 'package:weather_project/widgets/todays_weather.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("আমার আবহাওয়া"),
        backgroundColor: AppColors.denim_,
        titleSpacing: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: FutureBuilder(
            future: WeatherServies().weatherModelServies("Dhaka"),
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
                      const SizedBox(height: 25),
                      InkWell(
                        onTap: () {
                          Get.to(SevenDaysWeather(
                            weatherModel: weatherModel,
                          ));
                        },
                        child: Container(
                            height: 70,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "প্রতি ঘন্টার আবহাওয়া",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            )),
                      ),
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
