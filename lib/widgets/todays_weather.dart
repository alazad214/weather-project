import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:weather_project/models/weather_model.dart';

class TodaysWeather extends StatelessWidget {
  WeatherModel? weatherModel;

  TodaysWeather({super.key, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
            weatherType: WeatherType.dusty,
            width: double.infinity,
            height: 250),
        SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 30,
                      )),
                  Text(
                    weatherModel!.location!.name.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Text(
                weatherModel!.current!.lastUpdated.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                        "https:${weatherModel!.current!.condition!.icon.toString()}"),
                    Text(
                      weatherModel!.current!.tempC!.round().toString(),
                      style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
