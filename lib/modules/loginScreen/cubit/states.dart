abstract class LoginStates{}

class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessfulState extends LoginStates{}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}


class ChangeSuccessfully extends LoginStates{}