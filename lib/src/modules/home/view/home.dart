import 'package:flutter/material.dart';

import '../../../utils/routes/custom_routes.dart';
import '../../setting/view/setting_view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE31640),
        title: Image.asset(
          'assets/images/elvan.png',
          height: 20,
        ),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
