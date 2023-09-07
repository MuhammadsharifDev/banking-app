part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final Status firebaseStatus;

  const LoginState({
    this.firebaseStatus = Status.initial,
  });

  LoginState copyWith({
    Status? firebaseStatus,
  }) {
    return LoginState(
      firebaseStatus: firebaseStatus ?? this.firebaseStatus,
    );
  }

  @override
  List<Object?> get props => [
        firebaseStatus,
      ];
}

enum Status {
  initial,
  success,
  loading,
  error,
}

extension FirebaseStatus on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}
