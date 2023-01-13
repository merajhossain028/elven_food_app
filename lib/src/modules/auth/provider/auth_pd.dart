import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emainCntrlPd = Provider((ref) {
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

final passwordCntrlPd = Provider((ref) {
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});
