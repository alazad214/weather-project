import 'package:flutter/material.dart';
import 'package:weather_project/models/weather_model.dart';
import 'package:weather_project/servies/weather_servies.dart';
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
          child: FutureBuilder(
              future: WeatherServies().weatherModelServies("Dhaka"),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  WeatherModel? weatherModel = snapshot.data;
                  return TodaysWeather(weatherModel: weatherModel);
                }

                if (snapshot.hasError) {
                  return const Center(child: CircularProgressIndicator(color: Colors.red,));
                }

                return const Center(child: CircularProgressIndicator());
              })),
      drawer: Drawer(),
    );
  }
}
