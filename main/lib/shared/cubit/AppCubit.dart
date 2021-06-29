import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_and_shop_app/shared/cubit/AppStates.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_and_shop_app/shared/model/UserMoel.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          InitialState(),
        );

  late UserModel user;

  Future signUp(email, password, username) async {
    emit(LoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        print(value.user.email);
        print(value.user.uid);

        user = UserModel(
          name: username,
          userProfile:
              "https://hearhear.org/wp-content/uploads/2019/09/no-image-icon.png",
          products: [],
        );
        FirebaseFirestore.instance
            .collection("users")
            .doc(value.user!.email)
            .set(
              user.toMap(),
            );

        emit(SignUpState());
      },
    ).catchError(
      (erro) {
        emit(
          ErrorState(),
        );
      },
    );
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
            UserModel user =  UserModel.fromJson(value.data());
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
