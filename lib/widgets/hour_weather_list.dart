import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_project/models/weather_model.dart';

class HourWeatherList extends StatelessWidget {
  WeatherModel? weatherModel;
  HourWeatherList({super.key, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 120,
        child: ListView.builder(
            itemCount: weatherModel!.forecast!.forecastday![0].hour!.length,
            shrinkWrap: true,
            primary: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Container(
                  margin: const EdgeInsets.all(5),
                  height: 120,
                  width: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weatherModel!
                                .forecast!.forecastday![0].hour![index].tempC!
                                .round()
                                .toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            "0",
                            style: TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black12),
                        child: Image.network(
                            "https:${weatherModel!.forecast!.forecastday![0].hour![index].condition!.icon.toString()}"),
                      ),
                      Text(
                        DateFormat.j().format(DateTime.parse(
                          weatherModel!
                              .forecast!.forecastday![0].hour![index].time
                              .toString(),
                        )),
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}
