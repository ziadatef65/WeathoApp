import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/modules/homeScreen/cubit/cubit.dart';
import 'package:weather_app/modules/homeScreen/cubit/states.dart';
import 'package:weather_app/modules/loginScreen/login_screen.dart';
import 'package:weather_app/shared/components/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            DateTime stringToDateTime (String value){
              return DateTime.parse(value);
            }
            if (state is HomeInitialState) {
              return Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5E1EBB), Color(0xFF230E53)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        right: size.width * 0.05,
                        top: 40,
                        bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search About Your City',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 24,
                            decoration: TextDecoration.none,
                          )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  onSubmitted: (value) async {
                                    HomeCubit.get(context).getWeather(value);
                                  },
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                      suffixIcon: const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      filled: true,
                                      fillColor:
                                          const Color.fromRGBO(43, 26, 100, 1),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              height: 60,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: const Offset(5, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(18),
                                color: const Color.fromRGBO(43, 26, 100, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    HomeCubit.get(context).logout();
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                                  },
                                  icon: const Icon(
                                    Icons.logout_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(5, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(43, 26, 100, 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    'You have not selected a city yet. \n\nPlease select a city from the search button above.',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.center,
                                    '🥱',
                                    style: TextStyle(
                                      fontSize: 44,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            } else if (state is WeatherSuccessState) {
              return Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5E1EBB), Color(0xFF230E53)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        right: size.width * 0.05,
                        top: 40,
                        bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search About Your City',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 24,
                            decoration: TextDecoration.none,
                          )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  onSubmitted: (value) {
                                    HomeCubit.get(context).getWeather(value);
                                  },
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                      suffixIcon: const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      filled: true,
                                      fillColor:
                                          const Color.fromRGBO(43, 26, 100, 1),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              height: 60,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: const Offset(5, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(18),
                                color: const Color.fromRGBO(43, 26, 100, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    HomeCubit.get(context).logout();
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                                  },
                                  icon: const Icon(
                                    Icons.logout_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(5, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(43, 26, 100, 1),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  width: double.infinity,
                                  clipBehavior: Clip.hardEdge,
                                  decoration:   BoxDecoration(
                                      borderRadius:  const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                        stringToDateTime(HomeCubit.get(context).weatherModel!.date!).hour < 19 ?  const AssetImage(
                                        'assets/images/morning.png'): const AssetImage(
                                          'assets/images/night.png'),
                                      )),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 20,
                                  child: Text(
                                    HomeCubit.get(context).weatherModel!.cityName!,
                                    style: GoogleFonts.poppins(
                                      textStyle:const TextStyle(
                                        fontSize: 48,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  top: 320,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(98, 47, 181, 1),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20,right: 20,top: 50,bottom: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      HomeCubit.get(context).weatherModel!.temp.toString(),
                                                      style: GoogleFonts.poppins(
                                                          textStyle:const TextStyle(
                                                              fontWeight: FontWeight.bold,color: Colors.white,
                                                              fontSize: 48
                                                          )
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5,),
                                                    Text(
                                                      '°C',
                                                      style: GoogleFonts.poppins(
                                                        textStyle:const TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.white,
                                                          fontSize: 40,
                                                        ),
                                                      ), ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      height: 80,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage('https:${HomeCubit.get(context).weatherModel!.image}')
                                                        )
                                                      ),
                                                    ),
                                                    Text(
                                                      HomeCubit.get(context).weatherModel!.weatherCondition!,
                                                      style: GoogleFonts.poppins(
                                                        textStyle:const TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.white,
                                                          fontSize: 16
                                                        )
                                                      ),
                                                    ),

                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(width: 20,),

                                              Expanded(
                                                child: Container(
                                                  height:130,
                                                  width: 110,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: Colors.black45,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 15),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:Alignment.topCenter,
                                                          child: Text(
                                                            'Max-temp',
                                                            style: GoogleFonts.poppins(
                                                              textStyle:const TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 20,
                                                                color: Colors.white,
                                                              )
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:Alignment.bottomCenter,
                                                          child: Text(
                                                            '${HomeCubit.get(context).weatherModel!.maxTemp!.round()}',
                                                            style: GoogleFonts.poppins(
                                                              textStyle:const TextStyle(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 32,
                                                                color: Colors.white,
                                                              )
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20,),
                                              Expanded(
                                                child: Container(
                                                  height:130,
                                                  width: 110,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: Colors.black45,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 15),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:Alignment.topCenter,
                                                          child: Text(
                                                            'Min-temp',
                                                            style: GoogleFonts.poppins(
                                                                textStyle:const TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 20,
                                                                  color: Colors.white,
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:Alignment.bottomCenter,
                                                          child: Text(
                                                            '${HomeCubit.get(context).weatherModel!.minTemp!.round()}',
                                                            style: GoogleFonts.poppins(
                                                                textStyle:const TextStyle(
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: 32,
                                                                  color: Colors.white,
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20,),

                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 280,
                                  right: 40,
                                  left: 40,
                                  bottom:325 ,
                                  child: SingleChildScrollView(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                        border: Border.all(color: mainColor)
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10,),
                                            Text(
                                              'Updated At',
                                              style: GoogleFonts.rubik(
                                                textStyle:const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800,
                                                )
                                              ),
                                            ),
                                            const SizedBox(height: 2,),
                                    
                                            Text(
                                              '${stringToDateTime(HomeCubit.get(context).weatherModel!.date!).day}'
                                                  ':'
                                             '${stringToDateTime(HomeCubit.get(context).weatherModel!.date!).month}'
                                                  ':'
                                             '${stringToDateTime(HomeCubit.get(context).weatherModel!.date!).year}'
                                                  '     '
                                             '${stringToDateTime(HomeCubit.get(context).weatherModel!.date!).hour}'
                                                  ':'
                                             '${stringToDateTime(HomeCubit.get(context).weatherModel!.date!).minute}'
                                              ,
                                              style: GoogleFonts.rubik(
                                                textStyle:const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300
                                                )
                                              ),
                                            ),
                                            const SizedBox(height: 7,),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ));
            } else if (state is WeatherLoadedState) {
              return Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5E1EBB), Color(0xFF230E53)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        right: size.width * 0.05,
                        top: 40,
                        bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search About Your City',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 24,
                            decoration: TextDecoration.none,
                          )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  onSubmitted: (value) {
                                    HomeCubit.get(context).getWeather(value);
                                  },
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                      suffixIcon: const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      filled: true,
                                      fillColor:
                                          const Color.fromRGBO(43, 26, 100, 1),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              height: 60,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: const Offset(5, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(18),
                                color: const Color.fromRGBO(43, 26, 100, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    HomeCubit.get(context).logout();
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                                  },
                                  icon: const Icon(
                                    Icons.logout_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: const Offset(5, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromRGBO(43, 26, 100, 1),
                              ),
                              child: const Center(
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ));
            } else {
              return Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5E1EBB), Color(0xFF230E53)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        right: size.width * 0.05,
                        top: 40,
                        bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search About Your City',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 24,
                            decoration: TextDecoration.none,
                          )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  onSubmitted: (value) async {
                                    HomeCubit.get(context).getWeather(value);
                                  },
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                      suffixIcon: const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      filled: true,
                                      fillColor:
                                          const Color.fromRGBO(43, 26, 100, 1),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              height: 60,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: const Offset(5, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(18),
                                color: const Color.fromRGBO(43, 26, 100, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    HomeCubit.get(context).logout();
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                                  },
                                  icon: const Icon(
                                    Icons.logout_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(5, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(43, 26, 100, 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    'There is an error here that we will fix soon.\n Or try to search again..',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.center,
                                    '⚠️',
                                    style: TextStyle(
                                      fontSize: 44,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }
          },
        ),
      ),
    );
  }
}
