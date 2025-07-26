import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksbv_kannur_jilla/controller/nav_bar_controller.dart';
import 'package:sksbv_kannur_jilla/controller/text_field_controller.dart';
import 'package:sksbv_kannur_jilla/firebase_options.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';
import 'package:sksbv_kannur_jilla/screens/home_screen.dart';
import 'package:sksbv_kannur_jilla/widgets/nav_bar_widget.dart';

void main() async {
  await _setup();
  runApp(const MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);

  Get.put(NavBarController());
  Get.put(TextFieldController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SKSBV Kannur District',
      theme: ThemeData(
        fontFamily: 'poppins',
        scaffoldBackgroundColor: scaffoldColor,
      ),
      home: NavBar(child: const HomeScreen()),
    );
  }
}
