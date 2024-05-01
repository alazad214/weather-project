import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_project/models/weather_model.dart';
import 'package:weather_project/servies/weather_servies.dart';
import 'package:weather_project/widgets/hour_weather_list.dart';
import 'package:weather_project/widgets/todays_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("আমার আবহাওয়া"),
        backgroundColor: Colors.blueGrey,
        titleSpacing: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: FutureBuilder(
            future: WeatherServies().weatherModelServies("Dhaka"),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                WeatherModel? weatherModel = snapshot.data;

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
                      HourWeatherList(
                        weatherModel: weatherModel,
                      )
                    ],
                  ),
                );
              }

              if (snapshot.hasError) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              }

              return const Center(child: CircularProgressIndicator());
            }),
      )),
      drawer: Drawer(),
    );
  }
}
