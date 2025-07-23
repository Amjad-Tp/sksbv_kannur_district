import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sksbv_kannur_jilla/controller/nav_bar_controller.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController navController = Get.find<NavBarController>();

    return Drawer(
      shape: const RoundedRectangleBorder(),
      backgroundColor: scaffoldColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50,
                bottom: 20,
              ),
              child: Column(
                children: [
                  const Text(
                    'AutoShine',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Book Your Car Wash',
                    style: GoogleFonts.corinthia(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  cSizedBox5,
                  const Text(
                    'Version 1.0.0',
                    style: TextStyle(fontSize: 12, color: dividerColor),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(color: dividerColor),
            ),

            drawerItem('Home', 'assets/icons/dashboard-black.png', () {
              navController.changeTab(0);
              Get.back();
            }),
          ],
        ),
      ),
    );
  }

  InkWell drawerItem(String title, String imagePath, VoidCallback navigation) {
    return InkWell(
      onTap: navigation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              // Image.asset(imagePath, width: 25, fit: BoxFit.cover),
              cSizedBoxWidth15,
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
