abstract  class RegisterStates{}

class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  final String uid;
  RegisterSuccessState(this.uid);
}
class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);
}

