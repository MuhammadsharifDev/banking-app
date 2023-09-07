import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginBottomEvent>((event, emit) async {
      emit(
        state.copyWith(firebaseStatus: Status.loading),
      );
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(
          state.copyWith(firebaseStatus: Status.success),
        );
      } on FirebaseAuthException catch (e) {
        print('Error========>${e}');
        emit(
          state.copyWith(firebaseStatus: Status.error),
        );
      }
    });
  }
}
