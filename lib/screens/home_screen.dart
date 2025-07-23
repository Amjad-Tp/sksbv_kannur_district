import 'package:flutter/material.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return SingleChildScrollView(
      padding: screenPadding,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: const Center(child: Text('Home Screen')),
        ),
      ),
    );
  }
}
