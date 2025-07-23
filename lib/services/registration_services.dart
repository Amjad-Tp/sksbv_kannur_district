import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sksbv_kannur_jilla/functions/position_limits.dart';
import 'package:sksbv_kannur_jilla/models/registration_model.dart';

class RegistrationServices {
  final _fireStore = FirebaseFirestore.instance.collection('Registration');

  Future<String?> registerMember(MemberModel member) async {
    try {
      // Step 1: Get allowed count
      final allowedCount = positionLimits[member.position] ?? 1;

      // Step 2: Get current count in that zone for the same position
      final query = await _fireStore
          .where('zone', isEqualTo: member.zone)
          .where('position', isEqualTo: member.position)
          .get();

      if (query.docs.length >= allowedCount) {
        return '${member.position} already has $allowedCount members in ${member.zone}.';
      }

      // Step 3: Register new member
      await _fireStore.doc(member.id).set(member.toMap());
      return null;
    } catch (e) {
      print('Error: ${e.toString()}');
      return 'Error: ${e.toString()}';
    }
  }
}
