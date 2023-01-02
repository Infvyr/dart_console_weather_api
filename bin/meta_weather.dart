import 'package:meta_weather/meta_weather.dart';

void main(List<String> arguments) async{
  if (arguments.isEmpty) {
    print('Syntax: dart bin/main.dart <location>');
    return;
  }

  final city = arguments.first;
  final weatherApiClient = WeatherApiClient();
  final weather = await weatherApiClient.fetchWeatherByCity(city);
  print(weather);
}