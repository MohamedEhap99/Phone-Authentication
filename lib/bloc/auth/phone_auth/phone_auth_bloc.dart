import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/subjects.dart';
import 'package:test_phone_auth/api/repository.dart';
import 'package:test_phone_auth/bloc/auth/phone_auth/phone_states.dart';

class PhoneAuthBloc {
  final _repository = Repository();

  late BehaviorSubject<User?> _authStateChangedControllers;
  late Stream<User?> _user; //tube

  late BehaviorSubject<PhoneVerificationState?>
      _phoneVerificationStateChangedControllers;
  late Stream<PhoneVerificationState?> _phone; //tube

  PhoneAuthBloc() {
    _authStateChangedControllers = BehaviorSubject<User>();
    _user = _authStateChangedControllers.stream;

    if (_repository.currentUser() != null) {
      _authStateChangedControllers.add(_repository.currentUser()!);
    }
    _phoneVerificationStateChangedControllers =
        BehaviorSubject<PhoneVerificationState>();
    _phone = _phoneVerificationStateChangedControllers.stream;
  }

  Future<bool> verifyPhoneNumber({
    required String phoneNumber,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  }) async {
    _phoneVerificationStateChangedControllers.add(LoadingState());

    try {
      final result = await _repository.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
      return result;
    } on Exception catch (err) {
      _phoneVerificationStateChangedControllers
          .add(ErrorOccurredState(err.toString()));
      return false;
    }
  }

  Future<User?> signInWithPhoneNumber(
      AuthCredential phoneAuthCredential) async {
    try {
      User? user =
          (await _repository.signInWithPhoneNumber(phoneAuthCredential));
      _authStateChangedControllers.add(user!);
      return user;
    } catch (e) {
      _authStateChangedControllers.addError((e.toString()));
      return Future.error(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _repository.signOut();
      _authStateChangedControllers.add(null);
    } catch (e) {
      _authStateChangedControllers.addError(e);
      return;
    }
  }

  Stream<User?> get user => _user;

  User? currentUser() => _repository.currentUser();

  Stream<PhoneVerificationState?> get phone => _phone;

  Future<void>verificationCompleted(PhoneAuthCredential credential) async {
    await signInWithPhoneNumber(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    _phoneVerificationStateChangedControllers
        .add(ErrorOccurredState(error.toString()));
  }

  late String verificationId;
  codeSent(String verificationId, int? resendToken) {
    this.verificationId = verificationId;
    _phoneVerificationStateChangedControllers.add(PhoneNumberSubmitedState());
  }

  Future<void> submitOTP(otpCode) async {
    _phoneVerificationStateChangedControllers.add(LoadingState());
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode,
      );
      await signInWithPhoneNumber(credential);
      _phoneVerificationStateChangedControllers.add(OTPVerified());
    } catch (error) {
      _phoneVerificationStateChangedControllers
          .add(ErrorOccurredState(error.toString()));
    }
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    // _phoneVerificationStateChangedControllers
    //     .add(ErrorOccurredState("Time out"));
  }
}
