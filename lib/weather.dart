import 'package:intl/intl.dart';

class Weather {
  const Weather({
    required this.lastUpdated,
    required this.condition,
    required this.tempC,
    required this.windMph,
    required this.windDir,
    required this.pressureMb,
    required this.precipMm,
    required this.humidity,
    required this.feelsLikeC,
    required this.visKm,
    required this.uv,
    required this.airQualityCo,
    required this.airQualityNo2,
    required this.airQualityO3,
    required this.airQualitySo2,
    required this.airQualityUsEpaIndex,
    required this.airQualityGbDefraIndex,
  });

  final String lastUpdated;
  final double tempC;
  final String condition;
  final double windMph;
  final String windDir;
  final double pressureMb;
  final double precipMm;
  final int humidity;
  final double feelsLikeC;
  final double visKm;
  final double uv;
  final double airQualityCo;
  final double airQualityNo2;
  final double airQualityO3;
  final double airQualitySo2;
  final int airQualityUsEpaIndex;
  final int airQualityGbDefraIndex;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        lastUpdated: json['current']['last_updated'] as String,
        tempC: json['current']['temp_c'] as double,
        condition: json['current']['condition']['text'] as String,
        windMph: json['current']['wind_mph'] as double,
        windDir: json['current']['wind_dir'] as String,
        pressureMb: json['current']['pressure_mb'] as double,
        precipMm: json['current']['precip_mm'] as double,
        humidity: json['current']['humidity'] as int,
        feelsLikeC: json['current']['feelslike_c'] as double,
        visKm: json['current']['vis_km'] as double,
        uv: json['current']['uv'] as double,
        airQualityCo: json['current']['air_quality']['co'] as double,
        airQualityNo2: json['current']['air_quality']['no2'] as double,
        airQualityO3: json['current']['air_quality']['o3'] as double,
        airQualitySo2: json['current']['air_quality']['so2'] as double,
        airQualityUsEpaIndex:
            json['current']['air_quality']['us-epa-index'] as int,
        airQualityGbDefraIndex:
            json['current']['air_quality']['gb-defra-index'] as int,
      );

  @override
  String toString() => '''
    Last updated: ${DateFormat('MMMM dd, yyyy HH:mm').format(DateTime.parse(lastUpdated))}
    Temperature: $tempC °C
    Condition: $condition
    Wind: ${windMph}mph $windDir
    Pressure: $pressureMb mb
    Precipitation: $precipMm mm
    Humidity: $humidity%
    Feels like: $feelsLikeC °C
    Visibility: $visKm km
    UV: $uv
    Air quality:
      CO: ${airQualityCo.toStringAsFixed(2)} µg/m³,
      NO2: ${airQualityNo2.toStringAsFixed(2)} µg/m³,
      O3: ${airQualityO3.toStringAsFixed(2)} µg/m³,
      SO2: ${airQualitySo2.toStringAsFixed(2)} µg/m³,
      US EPA: $airQualityUsEpaIndex,
      GB DEFRA: $airQualityGbDefraIndex
  ''';
}
