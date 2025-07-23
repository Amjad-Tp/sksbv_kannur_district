import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';
import 'package:sksbv_kannur_jilla/functions/custom_button.dart';
import 'package:sksbv_kannur_jilla/screens/register_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Padding(
        padding: screenPadding,
        child: Column(
          children: [_buildImage(isWide), cSizedBox40, _buildRegisterSection()],
        ),
      ),
    );
  }

  //----Registration button with information
  Row _buildRegisterSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          child: Text(
            'Click here to Register JIlla Thahdees (ജില്ല തഹ്ദീസിനു രജിസ്റ്റർ ചെയ്യാൻ ഇവിടെ click ചെയ്യുക)',
          ),
        ),
        buildThemeTextButton(
          function: () => Get.to(() => const RegisterationScreen()),
          name: "Register",
        ),
      ],
    );
  }

  //---- image section
  ClipRRect _buildImage(bool isWide) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        'assets/images/samatha_flag.jpg',
        height: isWide ? 400 : null,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
