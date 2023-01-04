import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> verifyPhoneNumber({
    String? phoneNumber,
    Duration? timeout,
    int? forceResendingToken,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: timeout ?? const Duration(seconds: 100),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
      return Future.value(true);
    } on Exception {
      return Future.value(false);
    }
  }

  Future<UserCredential> signInWithPhoneNumber(
      AuthCredential phoneAuthCredential) async {
    return _auth.signInWithCredential(phoneAuthCredential)
      ..then((result) {
        DocumentReference docRef =
            _firestore.collection("users").doc(result.user!.uid);

        docRef.get().then((docSnapshot) {
          if (docSnapshot.exists) {
            docRef.update({'last_signin': Timestamp.now()});
          } else {
            docRef.set({
              'phone': result.user!.phoneNumber,
              'first_name': null,
              'last_name': null,
              'id': result.user!.uid,
              'created': Timestamp.now()
            });
          }
        }, onError: (error) {
          print("/// ERR /// $error");
        });
      });
  }

  User? currentUser() => _auth.currentUser;

  Future<void> signOut() => _auth.signOut();
}