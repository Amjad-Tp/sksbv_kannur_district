import 'package:flutter/material.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_container.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final Widget? backButton;
  const CustomAppbar({
    super.key,
    required this.title,
    this.trailing,
    this.backButton,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 80,
      decoration: const BoxDecoration(gradient: gradient),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                color: whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Align(alignment: Alignment.centerRight, child: trailing),
        ],
      ),
    );
  }
}
