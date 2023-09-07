part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginBottomEvent extends LoginEvent{
  final String email;
  final String password;
  LoginBottomEvent({required this.password,required this.email});
}