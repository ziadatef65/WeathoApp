import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/modules/loginScreen/login_screen.dart';
import 'package:weather_app/modules/splashScreen/splash_screen.dart';

import 'package:weather_app/shared/components/constants.dart';
import 'package:weather_app/shared/network/local/cacheHelper.dart';

import 'modules/homeScreen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  userId = await getUserUid();
  Widget widget;

  if(userId != null){
widget = HomeScreen();
 }else if(userId == 'haveBefore'){
    widget= LoginScreen();
  }else{
    widget = const SplashScreen();
  }

  runApp( MyApp(
    startWidget:  widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({super.key, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startWidget,
    );
  }
}
