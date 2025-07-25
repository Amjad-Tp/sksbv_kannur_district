import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sksbv_kannur_jilla/functions/circular_progress_indicator.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';
import 'package:sksbv_kannur_jilla/screens/registered_members_screen_controller.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_container.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_text_field.dart';
import 'package:sksbv_kannur_jilla/widgets/member_tile_widget.dart';

class RegisteredMembersScreen extends StatelessWidget {
  const RegisteredMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisteredMembersScreenController());

    return Obx(() {
      if (controller.isLoading.value == true) {
        return buildCircularProgressIndicator();
      }
      return SmartRefresher(
        controller: controller.refreshController,
        enablePullDown: true,
        onRefresh: controller.onRefresh,
        child: SingleChildScrollView(
          padding: screenPadding,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Header(controller: controller),
                  cSizedBox10,
                  ...controller.filteredZones().map(
                    (entry) => _ZoneSection(
                      zoneId: entry.key,
                      zoneName: entry.value,
                      controller: controller,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.controller});
  final RegisteredMembersScreenController controller;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Registered Members',
            style: TextStyle(fontSize: 17, fontWeight: fw600),
          ),
          cSizedBox15,
          CustomTextField(
            hintText: 'Search by Name or Designation or Zone',
            prefixIcon: Icons.search,
            onChanged: controller.updateSearch,
          ),
          cSizedBox15,
        ],
      ),
    );
  }
}

class _ZoneSection extends StatelessWidget {
  const _ZoneSection({
    required this.zoneId,
    required this.zoneName,
    required this.controller,
  });

  final String zoneId;
  final String zoneName;
  final RegisteredMembersScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final members = controller.membersForZone(zoneId);

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: CustomContainer(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                zoneName,
                style: const TextStyle(fontSize: 15, fontWeight: fw600),
              ),
              cSizedBox15,
              if (members.isEmpty)
                const Align(
                  alignment: Alignment.center,
                  child: Text('No Member Registered'),
                )
              else
                ...List.generate(members.length, (index) {
                  final member = members[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: MemberTile(member: member),
                  );
                }),
            ],
          ),
        ),
      );
    });
  }
}
