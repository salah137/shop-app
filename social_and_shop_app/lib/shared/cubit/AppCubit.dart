import 'package:bloc/bloc.dart';
import 'package:social_and_shop_app/shared/cubit/AppStates.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          InitialState(),
        );

  Future signUp(email, password) async {
    emit(LoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(SignUpState());
      
    }).catchError((erro) {});
  }
}
