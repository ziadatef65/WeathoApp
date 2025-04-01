
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/modules/homeScreen/home_screen.dart';
import 'package:weather_app/modules/loginScreen/cubit/cubit.dart';
import 'package:weather_app/modules/loginScreen/cubit/states.dart';
import 'package:weather_app/modules/registerScreen/register_screen.dart';
import 'package:weather_app/shared/components/components.dart';

import '../../shared/components/constants.dart';



class LoginScreen extends StatelessWidget {

   var emailController = TextEditingController();
   var passwordController = TextEditingController();
   var formKey = GlobalKey<FormState>();
   LoginScreen({super.key});

   @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;

    return BlocProvider(
      create:(BuildContext context )=>LoginScreenCubit(),
      child: BlocConsumer<LoginScreenCubit,LoginStates>(
        listener: (context,state){
          if(state is LoginLoadingState){
            SizedBox(
              height: size.height,
              width: size.width,
            child: const CircularProgressIndicator(color: Colors.white,),
            );


          }
          if(state is LoginSuccessfulState){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
            showToast(text:'Login successfully', state: ToastState.SUCCESS);

          }
          if(state is LoginErrorState){
             showToast(text: state.error.toString(), state: ToastState.ERROR);
             print(state.error);
          }
        },

        builder: (context,state){
          return Material(
            child: Container(
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
                            'Login',
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
                            'Enter your account details to login.',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontSize: 12,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                          decoration:
                          BoxDecoration(
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email must not empty";
                              }
                              return null;
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration:
                            InputDecoration(
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
                          decoration:
                          BoxDecoration(
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
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password must not empty";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: LoginScreenCubit.get(context).obsecure ? true : false,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration:
                            InputDecoration(
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
                              hintText: 'Enter Your Password Please',
                              hintStyle: const TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              suffixIcon: LoginScreenCubit.get(context).obsecure ? IconButton(
                                  onPressed: () {
                                    LoginScreenCubit.get(context).changeObsecureToFalse();
                                  },
                                  icon:  const Icon(CupertinoIcons.eye_slash,color: Colors.white,

                                  )
                              ) :
                              IconButton(
                                  onPressed: () {
                                    LoginScreenCubit.get(context).changeObsecureToTrue();
                                  },
                                  icon:  const Icon(CupertinoIcons.eye,color: Colors.white,

                                  )
                              ),
                            ),
                          )),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: (){},
                            child: Text(
                              'Forgot password?',
                              style: GoogleFonts.poppins(
                                  textStyle:const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  )
                              ),
                            )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            'or',
                            style: GoogleFonts.poppins(
                                textStyle:const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                          ),
                          const SizedBox(width: 5,),

                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Center(
                        child: Text(
                          'Sign in with',
                          style: GoogleFonts.rubik(
                              textStyle:const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28,
                                  color: Colors.white
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30,top: 40),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 35,
                                  child: InkWell(
                                    onTap: (){

                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/images/google.png'),
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'Google',
                                  style: GoogleFonts.rubik(
                                      textStyle:const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      )
                                  ),
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
                                    onTap: (){

                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/images/apple.png'),
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'Apple',
                                  style: GoogleFonts.rubik(
                                      textStyle:const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      )
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        width: size.width,
                        height: 60,
                        child: Center(
                            child: TextButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  LoginScreenCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);
                                }                              },

                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            )
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I’m new here',
                            style: GoogleFonts.rubik(
                                textStyle:const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white
                                )
                            ),
                          ),
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterScreen()));
                              },
                              icon: const Icon(CupertinoIcons.arrow_right,color: Colors.white,size: 24,)
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),


                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
