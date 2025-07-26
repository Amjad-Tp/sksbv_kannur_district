import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksbv_kannur_jilla/controller/nav_bar_controller.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';
import 'package:sksbv_kannur_jilla/screens/admin_login_screen.dart';
import 'package:sksbv_kannur_jilla/screens/home_screen.dart';
import 'package:sksbv_kannur_jilla/screens/registered_members_screen.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_container.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_drawer.dart';

class NavBar extends StatelessWidget {
  final Widget child;
  NavBar({super.key, required this.child});

  final NavBarController navController = Get.find<NavBarController>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> navTitles = ['Home', 'Registered Members'];

  final List<Widget> navPages = [
    const HomeScreen(),
    const RegisteredMembersScreen(isAdmin: false),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 1000;
        return Scaffold(
          key: scaffoldKey,
          body: Column(
            children: [
              CustomContainer(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                decoration: const BoxDecoration(gradient: gradient),
                child: Row(
                  children: [
                    if (!isWide)
                      IconButton(
                        icon: const Icon(Icons.menu_rounded, color: whiteColor),
                        onPressed: () => scaffoldKey.currentState?.openDrawer(),
                      ),
                    if (isWide) ...[
                      cSizedBoxWidth70,
                      Image.asset('assets/images/sksbv_logo.png', height: 65),
                      cSizedBoxWidth70,
                      Obx(() {
                        final selectedIndex = navController.currentIndex.value;
                        const double itemWidth = 100;

                        return SizedBox(
                          height: 60,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                left: selectedIndex * itemWidth,
                                child: Container(
                                  width: itemWidth,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: lightBlackColor.withValues(
                                      alpha: .2,
                                    ),
                                    borderRadius: borderRadius8,
                                  ),
                                ),
                              ),

                              // Nav items
                              Row(
                                children: List.generate(
                                  navTitles.length,
                                  (index) => GestureDetector(
                                    onTap: () => navController.changeTab(index),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: itemWidth,
                                      height: 60,
                                      child: Text(
                                        navTitles[index],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],

                    const Spacer(),
                    isWide
                        ? TextButton.icon(
                            onPressed: () =>
                                Get.to(() => const AdminLoginScreen()),
                            style: TextButton.styleFrom(
                              foregroundColor: whiteColor,
                            ),
                            icon: const Icon(
                              Icons.admin_panel_settings_rounded,
                            ),
                            label: const Text(
                              'Admin',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          )
                        : IconButton(
                            onPressed: () =>
                                Get.to(() => const AdminLoginScreen()),
                            icon: const Icon(
                              Icons.admin_panel_settings_rounded,
                              color: whiteColor,
                            ),
                          ),
                    if (isWide) cSizedBoxWidth70,
                  ],
                ),
              ),
              Expanded(
                child: Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                    child: KeyedSubtree(
                      key: ValueKey(navController.currentIndex.value),
                      child: navPages[navController.currentIndex.value],
                    ),
                  ),
                ),
              ),
            ],
          ),
          drawer: isWide ? null : const CustomDrawer(),
        );
      },
    );
  }
}
