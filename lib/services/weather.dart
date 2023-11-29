import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
const String appKey = 'b6a48b0f1b46724a137811c419b41e34';

class WeatherModel {

  Future<dynamic> getCityWeather(var cityName) async {
    final queryParams = {
      'q' : '${cityName}',
      'appid' : appKey,
      'units' : 'metric',
    };
    // https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    var url = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParams);
    print(url);
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData(url);
    return weatherData;

  }
  Future<dynamic> getLocationWeather() async {
    Location locationObj = Location();
    await locationObj.getCurrentLocation();
    // latitude = locationObj.latitude;
    //longitude = locationObj.longitude;

    final queryParams = {
      'lat': '${locationObj.latitude}',
      'lon': '${locationObj.longitude}',
      'appid': appKey,
      'units': 'metric',
    };
    // units above to be set to imperial if you want Fahrenheit

    //var url = Uri.https('api.openweathermap.org','/data/3.0/onecall', queryParams);

    // https://api.openweathermap.org/data/2.5/weather?
    var url = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParams);
    print(url);
    //api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}
    //  var url = Uri.https('api.openweathermap.org', '/data/2.5/forecast', queryParams);
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData(url);
    return weatherData;
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
