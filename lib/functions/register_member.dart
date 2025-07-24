import 'package:flutter/material.dart';
import 'package:sksbv_kannur_jilla/controller/register_controller.dart';
import 'package:sksbv_kannur_jilla/functions/alert_with_background_blur.dart';
import 'package:sksbv_kannur_jilla/functions/snack_bar.dart';
import 'package:sksbv_kannur_jilla/models/registration_model.dart';
import 'package:sksbv_kannur_jilla/services/registration_services.dart';
import 'package:uuid/uuid.dart';

void registerMember(
  BuildContext context,
  TextEditingController nameController,
  RegisterController registerController,
  String zone,
  String zoneId,
) {
  final name = nameController.text.trim();
  final position = registerController.selectedPosition.value;
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
        zoneId: zoneId,
      );

      final result = await registrationService.registerMember(member);

      if (result != null) {
        snackbar(result);
      } else {
        snackbar('$name is Registered');
        clearFilds(nameController, registerController);
      }
    },
    cancelButton: 'No',
    buttonName: 'Yes',
  );
}

void clearFilds(
  TextEditingController nameController,
  RegisterController registerController,
) {
  nameController.clear();
  registerController.selectedPosition.value = '';
}
