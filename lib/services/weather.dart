import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

const _apiKey = '24bdefd755d5db3c4a222b3a690bcdc5';
const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$baseUrl?q=$cityName&appid=$_apiKey&units=metric');
    var decodedData = await networkHelper.getData();
    return decodedData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    List<double?> coordinates = await location.getCurrentLocation();
    if (coordinates[0] == null && coordinates[1] == null) {
      return null;
    }
    NetworkHelper networkHelper = NetworkHelper(
        '$baseUrl?lat=${coordinates[0]}&lon=${coordinates[1]}&appid=$_apiKey&units=metric');
    var decodedData = await networkHelper.getData();
    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 200) {
      return ' ';
    } else if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
