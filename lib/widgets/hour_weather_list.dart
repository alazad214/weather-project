import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_project/models/weather_model.dart';

class HourWeatherList extends StatelessWidget {
  WeatherModel? weatherModel;
  HourWeatherList({super.key, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
            itemCount: weatherModel!.forecast!.forecastday![0].hour!.length,
            shrinkWrap: true,
            primary: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Container(
                  margin: const EdgeInsets.all(5),
                  height: 100,
                  width: 90,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Column(
                    children: [],
                  ));
            }),
      ),
    );
  }
}
