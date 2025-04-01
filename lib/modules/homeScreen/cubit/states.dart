import 'package:weather_app/models/weather_model.dart';

abstract class HomeStates{}

class HomeInitialState extends HomeStates{}
class NoWeatherState extends HomeStates{}
class WeatherLoadedState extends HomeStates{}
class WeatherFailureState extends HomeStates{
  final String error;
  WeatherFailureState(this.error);
}
class WeatherSuccessState extends HomeStates{

}
class UserLogoutSuccessfully extends HomeStates{

}