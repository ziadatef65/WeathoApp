import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/modules/loginScreen/login_screen.dart';
import 'package:weather_app/shared/components/constants.dart';
import 'package:weather_app/shared/network/local/cacheHelper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return
         Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5E1EBB), Color(0xFF230E53)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 60,
                height: size.height*0.70,
                width: size.width-100,
                child: Image.asset('assets/images/ss.png'),
              ),
              Positioned(
                left: size.width*0.05,
                bottom: size.height*0.28,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Weatho',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none
                          )
                      ),
                    ),
                    Text(
                      'Check Live weather updates \nall over the world with just one tap',
                      style: GoogleFonts.poppins(
                          textStyle:  const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              decoration: TextDecoration.none
                          )
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 50,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  width: size.width,
                  height: 80,
                  child: Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                        },

                        child: Text(
                          'Get started',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),

        );


  }
}
