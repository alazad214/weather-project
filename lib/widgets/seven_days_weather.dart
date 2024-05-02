import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/weather_model.dart';
import '../utils/colors.dart';

class SevenDaysWeather extends StatelessWidget {
  WeatherModel? weatherModel;
  SevenDaysWeather({super.key, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("আগামী সাতদিনের তাপমাত্রা"),
          titleSpacing: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            child: ListView.builder(
                itemCount: weatherModel!.forecast!.forecastday![0].date!
                    .toString()
                    .length,
                shrinkWrap: true,
                primary: true,
                itemBuilder: (_, index) {
                  return Container(
                      margin: const EdgeInsets.all(5),
                      height: 90,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: AppColors.navy_,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.denim_2),
                            child: Image.network(
                                "https:${weatherModel!.forecast!.forecastday![0].day!.condition!.icon}"),
                          ),
                          Text(
                            DateFormat.MMMEd().format(DateTime.parse(
                                weatherModel!.forecast!.forecastday![0].date!
                                    .toString())),
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                weatherModel!.forecast!.forecastday![0]
                                    .hour![index].tempC!
                                    .round()
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                "0",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ));
                }),
          ),
        ));
  }
}
