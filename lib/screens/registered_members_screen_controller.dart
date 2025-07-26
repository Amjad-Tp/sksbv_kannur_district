import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sksbv_kannur_jilla/functions/alert_with_background_blur.dart';
import 'package:sksbv_kannur_jilla/functions/maps.dart';
import 'package:sksbv_kannur_jilla/models/registration_model.dart';
import 'package:sksbv_kannur_jilla/services/registration_services.dart';

class RegisteredMembersScreenController extends GetxController {
  final refreshController = RefreshController(initialRefresh: false);
  final adminRefreshController = RefreshController(initialRefresh: false);
  final _service = RegistrationServices();
  final isLoading = false.obs;

  /// zoneId -> members
  final zoneMembers = <String, List<MemberModel>>{}.obs;

  final searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMembers();
  }

  Future<void> fetchMembers() async {
    isLoading.value = true;
    try {
      final Map<String, List<MemberModel>> data = {};
      for (final zoneId in zoneMapping.keys) {
        final members = await _service.fetchAllMember(zoneId);
        data[zoneId] = members;
      }
      zoneMembers.value = data;
    } finally {
      refreshController.refreshCompleted();
      isLoading.value = false;
    }
  }

  void onRefresh() => fetchMembers();

  /// Returns filtered members of a zone based on searchQuery
  List<MemberModel> membersForZone(String zoneId) {
    final base = zoneMembers[zoneId] ?? const <MemberModel>[];
    if (searchQuery.isEmpty) return base;

    final query = searchQuery.value.toLowerCase();
    return base.where((m) {
      return m.name.toLowerCase().contains(query) ||
          m.position.toLowerCase().contains(query);
    }).toList();
  }

  List<MapEntry<String, String>> filteredZones() {
    if (searchQuery.isEmpty) return zoneMapping.entries.toList();

    final query = searchQuery.value.toLowerCase();

    // Filter zones by zone name OR if any member matches the query
    return zoneMapping.entries.where((entry) {
      final zoneId = entry.key;
      final zoneName = entry.value.toLowerCase();

      // Zone name match
      final zoneMatches = zoneName.contains(query);

      // Members match
      final membersMatch = (zoneMembers[zoneId] ?? []).any(
        (m) =>
            m.name.toLowerCase().contains(query) ||
            m.position.toLowerCase().contains(query),
      );

      return zoneMatches || membersMatch;
    }).toList();
  }

  /// Update search text
  void updateSearch(String value) {
    searchQuery.value = value;
  }

  void deleteMember(String memberId) {
    alertWithBackgroundBlur(
      title: "Delete Member",
      widget: const Text("Are you sure you want to delete this member?"),
      function: () async {
        await _service.deleteMember(memberId);
        onRefresh();
        Get.back();
      },
      buttonName: 'Yes',
    );
  }
}
