import 'package:flutter/material.dart';
import 'package:sksbv_kannur_jilla/functions/alert_with_background_blur.dart';
import 'package:sksbv_kannur_jilla/functions/snack_bar.dart';
import 'package:sksbv_kannur_jilla/models/registration_model.dart';
import 'package:sksbv_kannur_jilla/services/registration_services.dart';
import 'package:uuid/uuid.dart';

void registerMember(
  BuildContext context,
  String name,
  String zone,
  String position,
) {
  if (name.isEmpty || zone.isEmpty || position.isEmpty) {
    snackbar('Fill the Fields');
    return;
  }
  alertWithBackgroundBlur(
    title: 'Are you sure?',
    widget: const Text("You can't Edit after Registering"),
    function: () async {
      final registrationService = RegistrationServices();

      final id = const Uuid().v4();

      final member = MemberModel(
        id: id,
        name: name,
        zone: zone,
        position: position,
      );

      final result = await registrationService.registerMember(member);

      if (result != null) {
        snackbar(result);
      } else {
        snackbar('$name is Registered');
        Navigator.of(context).pop();
      }
    },
    cancelButton: 'No',
    buttonName: 'Yes',
  );
}
