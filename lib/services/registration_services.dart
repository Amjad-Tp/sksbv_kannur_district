import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sksbv_kannur_jilla/functions/maps.dart';
import 'package:sksbv_kannur_jilla/models/registration_model.dart';

class RegistrationServices {
  final _fireStore = FirebaseFirestore.instance.collection('Registration');

  Future<String?> registerMember(MemberModel member) async {
    try {
      // Get allowed count for the position
      final allowedCount = positionLimits[member.position] ?? 1;

      final memberRef = _fireStore.doc(member.zoneId).collection('Members');

      // Count how many members already hold the same position in the zone
      final query = await memberRef
          .where('position', isEqualTo: member.position)
          .get();

      if (query.docs.length >= allowedCount) {
        return '${member.position} already has $allowedCount members in ${member.zone} zone.';
      }

      await memberRef.doc(member.id).set(member.toMap());

      return null;
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  Future<List<MemberModel>> fetchAllMember(String zoneId) async {
    final snapshot = await _fireStore.doc(zoneId).collection('Members').get();

    return snapshot.docs.map((doc) => MemberModel.fromMap(doc.data())).toList();
  }

  Future<void> deleteMember(String memberId) async {
    await FirebaseFirestore.instance
        .collection('members')
        .doc(memberId)
        .delete();
  }
}
