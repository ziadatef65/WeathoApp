import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/modules/homeScreen/cubit/states.dart';

import '../../../services/weather_servive.dart';

class HomeCubit extends Cubit<HomeStates> {

  HomeCubit() : super(HomeInitialState());
  WeatherModel? weatherModel;
 static HomeCubit get(context) => BlocProvider.of(context);
  getWeather(cityName) async {
    emit(WeatherLoadedState());
    try {
       weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }


    Future<void> logout() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('uid');
      emit(UserLogoutSuccessfully());
    }
  }



