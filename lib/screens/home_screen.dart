import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_project/models/weather_model.dart';
import 'package:weather_project/screens/news_screen.dart';
import 'package:weather_project/servies/weather_servies.dart';
import 'package:weather_project/utils/colors.dart';
import 'package:weather_project/utils/search_location.dart';
import 'package:weather_project/widgets/button.dart';
import 'package:weather_project/widgets/hour_weather_list.dart';
import 'package:weather_project/widgets/todays_weather.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SearchLocation searchLocation = SearchLocation();
  final TextEditingController searchcontroller = TextEditingController();
  String searchText = "Dhaka";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("আমার আবহাওয়া"),
        backgroundColor: AppColors.denim_,
        titleSpacing: 0,
        actions: [
          IconButton(
              onPressed: () async {
                String text = await searchLocation.searchDialog(
                    context, searchcontroller);

                setState(() {
                  searchText = text;
                });
              },
              icon: const Icon(
                Icons.search,
                size: 40,
                color: Colors.green,
              )),
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
                      const SizedBox(height: 15),
                      CustomButton(
                        text: "আবহাওয়ার খবর",
                        ontap: () {
                          Get.to(() => NewsScreen());
                        },
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
