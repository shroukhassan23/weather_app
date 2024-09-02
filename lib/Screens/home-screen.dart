import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget getWeatherIcon(int code, BuildContext context) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'lib/assets/images/cool.png',
        );
      case >= 300 && < 400:
        return Image.asset(
          'lib/assets/images/weather1.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.65,
        );
      case >= 500 && < 600:
        return Image.asset(
          'lib/assets/images/weather2.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.65,
        );
      case >= 600 && < 700:
        return Image.asset(
          'lib/assets/images/windy.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.65,
        );
      case >= 700 && < 800:
        return Image.asset(
          'lib/assets/images/weather3.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.65,
        );
      case == 800:
        return Image.asset(
          'lib/assets/images/sun.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.65,
        );
      case > 800 && <= 804:
        return Image.asset(
          'lib/assets/images/lighning.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.65,
        );
      default:
        return Image.asset(
          'lib/assets/images/lighning.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.65,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 40,
          right: 15,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 107, 177, 253),
                      shape: BoxShape.circle),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-2, -0.3),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 196, 218, 240),
                      shape: BoxShape.circle),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.5),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 93, 193, 208),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1, 1.5),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 165, 215, 223),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                if (state is WeatherBlocSuccess) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${state.weather.areaName}",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Good Morning",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        getWeatherIcon(
                            state.weather.weatherConditionCode as int, context)
                        // Image.asset(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: MediaQuery.of(context).size.width * 0.65,
                        //   "lib/assets/images/lighning.png",
                        // ),,
                        ,
                        Center(
                          child: Text(
                            "${state.weather.temperature!.celsius!.round()}",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        ),
                        Center(
                          child: Text(
                            "${state.weather.weatherMain}",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Center(
                          child: Text(
                            DateFormat('EEEE,dd.')
                                .add_jm()
                                .format(state.weather.date as DateTime),
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "lib/assets/images/sun.png",
                                  scale: 8,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text("Sun rise"),
                                    Text(
                                      DateFormat().add_jm().format(
                                          state.weather.sunrise as DateTime),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Image.asset(
                                  "lib/assets/images/weather3.png",
                                  scale: 8,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text("Sun set"),
                                    Text(
                                      DateFormat().add_jm().format(
                                          state.weather.sunset as DateTime),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: const Color.fromARGB(255, 183, 182, 182),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "lib/assets/images/temperature.png",
                                  scale: 8,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text("Max timp"),
                                    Text("${state.weather.tempMax}")
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Image.asset(
                                  "lib/assets/images/cool.png",
                                  scale: 8,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text("Min timp"),
                                    Text("${state.weather.tempMax}")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
