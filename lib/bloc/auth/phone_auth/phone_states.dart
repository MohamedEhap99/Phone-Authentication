abstract class PhoneVerificationState {}

/// For Loading State When User Enter Submit

class LoadingState extends PhoneVerificationState {}

/// When Occurred  Error because anything
class ErrorOccurredState extends PhoneVerificationState {
  final String errorMsg;
  ErrorOccurredState(this.errorMsg);
}

/// When User Enter his Number Phone
class PhoneNumberSubmitedState extends PhoneVerificationState {}

/// When User Enter Code
class OTPVerified extends PhoneVerificationState {}
