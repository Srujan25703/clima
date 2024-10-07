import 'package:clima/utilities/constants.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';


class WeatherModel {
  Future<dynamic> getWeatherData() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    var longitude = loc.long;
    var latitude = loc.lat;
    NetworkHelper nh = NetworkHelper(
        url:
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
    var weatherdata = await nh.getData();

    return weatherdata;
  }
  Future<dynamic> getcityWeatherData(String city) async {
    Location loc = Location();
    await loc.getCurrentLocation();
    NetworkHelper nh = NetworkHelper(
        url:
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric');
    var weatherdata = await nh.getData();
    print(weatherdata);
    return weatherdata;

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
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
