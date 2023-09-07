part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class RegstrEvent extends SignupEvent{
  final String email;
  final String password;
  RegstrEvent({required this.password,required this.email});
}