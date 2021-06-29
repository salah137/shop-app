import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_and_shop_app/shared/cubit/AppStates.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          InitialState(),
        );

  Future signUp(email, password, username) async {
    emit(LoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      FirebaseFirestore.instance.collection("users").doc(value.user!.email).set(
        {
          "user name": username,
        },
      );

      emit(SignUpState());
    }).catchError((erro) {
      emit(
        ErrorState(),
      );
    });
  }

  Future signIn(email, password) async {
    emit(LoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(value.user!.email)
            .get()
            .then(
          (value) {
            print(value.data()["user name"]);
          },
        );
      },
    ).catchError((error) {
      print(error.toString());
      emit(
        ErrorState(),
      );
    });
  }
}
