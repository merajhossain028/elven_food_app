import 'package:flutter/material.dart';
class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: const Center(
        child: Text('Demo'),
      ),
    );
  }
}