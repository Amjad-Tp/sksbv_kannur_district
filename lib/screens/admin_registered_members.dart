import 'package:flutter/material.dart';
import 'package:sksbv_kannur_jilla/screens/registered_members_screen.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_appbar.dart';

class AdminRegisteredMembers extends StatelessWidget {
  const AdminRegisteredMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomAppbar(title: 'Admin Panel'),
            Expanded(child: RegisteredMembersScreen(isAdmin: true)),
          ],
        ),
      ),
    );
  }
}
