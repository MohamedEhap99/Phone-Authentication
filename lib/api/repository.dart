import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_phone_auth/api/auth_api.dart';


class Repository {
  final _phoneAuthApi = PhoneAuthApi();


// Auth
  Future<User?> signInWithPhoneNumber(
          AuthCredential phoneAuthCredential) async =>
      (await _phoneAuthApi.signInWithPhoneNumber(phoneAuthCredential)).user;

  Future<bool> verifyPhoneNumber({
    required String phoneNumber,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  }) =>
      _phoneAuthApi.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

  Future<void> signOut() => _phoneAuthApi.signOut();

  User ?currentUser() => _phoneAuthApi.currentUser();


}
