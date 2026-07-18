enum SignupStatus {
  initial,
  loading,
  success,
  failure,
}

class SignupState {

  final SignupStatus status;

  final String? message;

  const SignupState({

    this.status = SignupStatus.initial,

    this.message,
  });

  SignupState copyWith({

    SignupStatus? status,

    String? message,
  }) {

    return SignupState(

      status: status ?? this.status,

      message: message ?? this.message,
    );
  }
}