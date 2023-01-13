import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/auth_pd.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword(WidgetRef ref) async {
    await _auth.signInWithEmailAndPassword(
      email: ref.read(emainCntrlPd).toString().trim(),
      password: ref.read(passwordCntrlPd).toString().trim(),
    );
  }
   Future<void> createUserWithEmailAndPassword(WidgetRef ref) async {
    await _auth.signInWithEmailAndPassword(
      email: ref.read(emainCntrlPd).toString().trim(),
      password: ref.read(passwordCntrlPd).toString().trim(),
    );
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
