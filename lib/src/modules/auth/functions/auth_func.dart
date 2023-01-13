import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/auth_pd.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword(WidgetRef ref) async {
    final email = ref.read(emainCntrlPd).text.toString().trim();
    final password = ref.read(passwordCntrlPd).text.toString().trim();
    debugPrint('signInWithEmailAndPassword... $email, $password');
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword(WidgetRef ref) async {
    await _auth.signInWithEmailAndPassword(
      email: ref.read(emainCntrlPd).text.toString().trim(),
      password: ref.read(passwordCntrlPd).text.toString().trim(),
    );
  }

  // Future<void> signOut() async {
  //   await _auth.signOut();
  // }
}
