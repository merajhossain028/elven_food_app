import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/app.dart' show App;
import 'src/configs/ip_configs.dart' show configIpsUrls;
import 'src/db/db.dart' show openAppDB;
import 'src/utils/paths/paths.dart' show initDir;

Future main() async {
  await initDir();
  await openAppDB();
  await configIpsUrls();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: App()));
}
