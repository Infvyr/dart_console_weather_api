import 'dart:io';

import 'package:meta_weather/meta_weather.dart';

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Syntax: dart bin/main.dart <location>');
    return;
  }

  final city = arguments.first;
  final weatherApiClient = WeatherApiClient();
  try {
    final weather = await weatherApiClient.fetchWeatherByCity(city);
    print(weather);
  } on WeatherApiException catch (e) {
    print(e.message);
  } on SocketException catch (_) {
    print('Could not fetch data. Check your internet connection!');
  } catch (e) {
    print(e);
  }
}
