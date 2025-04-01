import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/modules/homeScreen/home_screen.dart';
import 'package:weather_app/modules/registerScreen/cubit/cubit.dart';
import 'package:weather_app/modules/registerScreen/cubit/states.dart';
import 'package:weather_app/shared/components/components.dart';

import '../../shared/components/constants.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    return BlocProvider(
      create: (BuildContext context)=>RegisterCubit(),
      child: Material(
        child: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state) {
          if (state is RegisterSuccessState) {
            showToast(text: 'Register Successfully', state: ToastState.SUCCESS);
            Navigator.push(context, MaterialPageRoute(builder: (context) =>   HomeScreen()));

          }
          if (state is RegisterErrorState){
            showToast(text: state.error, state: ToastState.ERROR);
          }
        }, builder: (context, state) {
          if (state is RegisterLoadingState) {
            return Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF5E1EBB), Color(0xFF230E53)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child:  const Center(child: CircularProgressIndicator(color: Colors.white)));
          }
          return Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF5E1EBB), Color(0xFF230E53)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.08,
                  right: size.width * 0.08,
                  top: 70,
                  bottom: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 36,
                          )),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Get ready to log in and discover the weather anywhere with just one click.',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 16,
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        height: 65,
                        width: size.width,
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Email must not empty";
                            }
                            return null;
                          },
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(43, 26, 108, 1),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              hintText: 'Enter Your Email Please',
                              hintStyle: const TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        height: 65,
                        width: size.width,
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Password must not empty";
                            }
                            return null;
                          },
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(43, 26, 108, 1),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            errorBorder:OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(18),
                            ) ,
                            hintText: 'Enter Your Password Please',
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.eye_slash,
                                  color: Colors.white,
                                )),
                          ),
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(25)),
                      width: size.width,
                      height: 60,
                      child: Center(
                          child: TextButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();
                            if (email.isNotEmpty && password.isNotEmpty) {
                              BlocProvider.of<RegisterCubit>(context)
                                  .registerUser(
                                  email: email, password: password);
                            }
                          }
                        },
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      )),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'or',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Sign up with',
                        style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                child: InkWell(
                                  onTap: () {
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/images/google.png'),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Google',
                                style: GoogleFonts.rubik(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                )),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/images/apple.png'),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Apple',
                                style: GoogleFonts.rubik(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
