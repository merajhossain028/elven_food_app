import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show BuildContext, Key, StreamBuilder, Widget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:elven_food_app/src/modules/home/view/home.dart';

import '../../../configs/size_config.dart' show ScreenSize;
import '../../../localization/loalization.dart' show t;
import '../../auth/view/signin.dart';
class AppRouter extends ConsumerWidget {
  AppRouter({Key? key}) : super(key: key);

  final ScreenSize _sizeConfig = ScreenSize();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _sizeConfig.init(context);
    t = AppLocalizations.of(context);
    // Check if Auth is needed
    //return const Home();
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Home();
        } else {
          return const SignInPage();
        }
      },
      );
  }
}
