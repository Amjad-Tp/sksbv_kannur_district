import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sksbv_kannur_jilla/functions/maps.dart';
import 'package:sksbv_kannur_jilla/models/registration_model.dart';
import 'package:sksbv_kannur_jilla/services/registration_services.dart';

enum SortField { position, name }

class RegisteredMembersScreenController extends GetxController {
  final refreshController = RefreshController(initialRefresh: false);
  final _service = RegistrationServices();
  final isLoading = false.obs;

  /// zoneId -> members
  final zoneMembers = <String, List<MemberModel>>{}.obs;

  final searchQuery = ''.obs;
  final sortField = SortField.position.obs;
  final ascending = true.obs;

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
    }
    isLoading.value = false;
  }

  void onRefresh() => fetchMembers();

  // ------- UI helpers --------
  List<MemberModel> _applySearchAndSort(List<MemberModel> list) {
    final q = searchQuery.value.toLowerCase();
    var filtered = list.where((m) {
      return m.name.toLowerCase().contains(q) ||
          m.position.toLowerCase().contains(q);
    }).toList();

    int Function(MemberModel a, MemberModel b) comparator;
    switch (sortField.value) {
      case SortField.position:
        comparator = (a, b) => a.position.compareTo(b.position);
        break;
      case SortField.name:
        comparator = (a, b) => a.name.compareTo(b.name);
        break;
    }

    filtered.sort(comparator);
    if (!ascending.value) {
      filtered = filtered.reversed.toList();
    }
    return filtered;
  }

  /// Returns the processed (searched + sorted) members of a zone
  List<MemberModel> membersForZone(String zoneId) {
    final base = zoneMembers[zoneId] ?? const <MemberModel>[];
    return _applySearchAndSort(base);
  }

  void setSearch(String v) => searchQuery.value = v;
  void setSortField(SortField f) => sortField.value = f;
  void toggleAscending() => ascending.value = !ascending.value;
}
