import 'dart:convert';

import 'package:http/http.dart' as http;

import 'weather.dart';

class WeatherApiException implements Exception {
  const WeatherApiException(this.message);

  final String message;
}

class WeatherApiClient {
  static const _baseUrl = 'api.weatherapi.com';
  static const _baseUrlVersion = '/v1/current.json';

  static Map<String, String> _locationOptions(String location) =>
      {'key': 'YOUR_API_KEY', 'q': location, 'aqi': 'yes'};

  Future<Weather> fetchWeather(String city) async {
    final url = Uri.https(_baseUrl, _baseUrlVersion, _locationOptions(city));
    final response = await http.get(url);

    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}');
      throw WeatherApiException('Error getting weather for: $city');
    }

    final Map<String, dynamic> jsonResponse =
        Map.castFrom(jsonDecode(response.body));

    if (jsonResponse.isEmpty) {
      throw WeatherApiException('Weather data for $city not found');
    }

    return Weather.fromJson(jsonResponse);
  }

  Future<Weather> fetchWeatherByCity(String city) async {
    return fetchWeather(city);
  }
}