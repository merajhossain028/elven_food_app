

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryCntrlrPd = Provider((ref) {
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

final itemCntrlrPd = Provider((ref) {
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

final descriptionCntrlrPd = Provider((ref) {
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

final priceCntrlrPd = Provider((ref) {
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});
