part of 'signup_bloc.dart';

@immutable
class SignupState extends Equatable {
  final Status firebaseStatus;

  const SignupState({this.firebaseStatus = Status.initial});

  SignupState copyWith({Status? firebaseStatus}) {
    return SignupState(firebaseStatus: firebaseStatus ?? this.firebaseStatus);
  }

  @override
  List<Object?> get props => [firebaseStatus];
}

enum Status { initial, loading, success, error }

extension FirebaseStatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}