import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emainCntrlPd = Provider((ref) {
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});
final signUpEmainCntrlPd = Provider((ref) {
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

final passwordCntrlPd = Provider((ref) {
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});
final signUpPasswordCntrlPd = Provider((ref) {
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

final confirmPasswordCntrlPd = Provider((ref) {
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance.signOut());