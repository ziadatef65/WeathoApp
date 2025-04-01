import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weather_app/modules/registerScreen/cubit/states.dart';
import 'package:weather_app/shared/network/local/cacheHelper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> registerUser({
    required String email, required String password
  }) async {
    emit(RegisterLoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid;

      await FirebaseFirestore
          .instance
          .collection('users')
          .doc(uid)
          .set(({
        "email": email,
        "uid": uid,
        "myCity": 'not selected yet',
      }));
      await saveUserInfo(uid, 'not selected yet');
      emit(RegisterSuccessState(uid));
    }
    catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }



}