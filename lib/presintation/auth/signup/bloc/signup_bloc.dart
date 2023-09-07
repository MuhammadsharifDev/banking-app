import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    on<RegstrEvent>((event, emit) async {
      emit(state.copyWith(firebaseStatus: Status.loading));
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(
          state.copyWith(firebaseStatus: Status.success),
        );
      } on FirebaseAuthException catch (e) {
        print('ERROR===>${e}');
        emit(
          state.copyWith(firebaseStatus: Status.error),
        );
      }
    });
  }
}