import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            cSizedBox40,
            Image.asset('assets/images/sksbv-logo-black.png', width: 150),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(color: lightGreyColor),
            ),

            drawerItem('Home', Icons.home_rounded, () {
              navController.changeTab(0);
              Get.back();
            }),

            drawerItem('Registered Members', Icons.groups_2_rounded, () {
              navController.changeTab(1);
              Get.back();
            }),
          ],
        ),
      ),
    );
  }

  InkWell drawerItem(String title, IconData icon, VoidCallback navigation) {
    return InkWell(
      onTap: navigation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Icon(icon, color: blackColor),
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
