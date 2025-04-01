import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/loginScreen/cubit/states.dart';
import 'package:weather_app/shared/components/constants.dart';

class LoginScreenCubit extends Cubit<LoginStates>{
  LoginScreenCubit ():super(LoginInitialState());
  static LoginScreenCubit get(context) => BlocProvider.of(context);


  void userLogin({
   required String email,
   required String password,
}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password)
        .then((value) {
          userId = value.user!.uid;
          emit(LoginSuccessfulState());
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });

    }

    bool obsecure = true;
  void changeObsecureToFalse (){
    obsecure = false;
    emit(ChangeSuccessfully());
  }
  void changeObsecureToTrue(){
    obsecure = true;
    emit(ChangeSuccessfully());
  }

}