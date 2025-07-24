import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';
import 'package:sksbv_kannur_jilla/functions/custom_button.dart';
import 'package:sksbv_kannur_jilla/functions/maps.dart';
import 'package:sksbv_kannur_jilla/functions/snack_bar.dart';
import 'package:sksbv_kannur_jilla/screens/register_screen.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_container.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          return Stack(
            children: [
              _buildBackgroundImage(),

              _loginContainer(
                isWide,
                userNameController,
                passwordController,
                formKey,
              ),
            ],
          );
        },
      ),
    );
  }

  Center _loginContainer(
    bool isWide,
    TextEditingController userNameController,
    TextEditingController passwordController,
    GlobalKey<FormState> key,
  ) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: isWide ? 450 : 350),
        child: CustomContainer(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Form(
            key: key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Zone Login',
                  style: TextStyle(fontWeight: fwBold, fontSize: 22),
                ),
                cSizedBox20,
                CustomTextField(
                  controller: userNameController,
                  keyboardType: TextInputType.number,
                  labelText: 'User Name',
                  hintText: 'User Name',
                  prefixIcon: Icons.person_3_rounded,
                ),
                cSizedBox20,
                CustomTextField(
                  controller: passwordController,
                  keyboardType: TextInputType.number,
                  labelText: 'Password',
                  hintText: 'password',
                  prefixIcon: Icons.lock_rounded,
                  obscureText: true,
                ),
                cSizedBox30,
                buildThemeTextButton(
                  function: () {
                    if (key.currentState!.validate()) {
                      String username = userNameController.text.trim();
                      String password = passwordController.text.trim();

                      if (zoneCredentials[username] == password) {
                        final zoneName = zoneMapping[username]!;
                        Get.off(
                          () => RegisterationScreen(
                            zoneName: zoneName,
                            zoneId: username,
                          ),
                        );
                      } else {
                        snackbar('Login Failed, Invalid username or password');
                      }
                    }
                  },
                  name: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned _buildBackgroundImage() {
    return Positioned.fill(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/login_background.jpg', fit: BoxFit.cover),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
