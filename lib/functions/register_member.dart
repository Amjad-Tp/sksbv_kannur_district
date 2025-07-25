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
  TextEditingController phoneController,
  RegisterController registerController,
  String zone,
  String zoneId,
) {
  final name = nameController.text.trim();
  final phone = phoneController.text.trim();
  final position = registerController.selectedPosition.value;
  if (name.isEmpty || zone.isEmpty || position.isEmpty || phone.isEmpty) {
    showErrorSnackbar(message: 'Fill the Feilds');
    return;
  } else if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
    showErrorSnackbar(message: 'Enter only Numbers');
    return;
  } else if (phone.length != 10) {
    showErrorSnackbar(message: 'Phone number must be 10 digits');
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
        phone: phone,
      );

      final result = await registrationService.registerMember(member);

      if (result != null) {
        showErrorSnackbar(message: result);
      } else {
        showSuccessSnackbar(message: '$name is Registered as $position');
        clearFilds(nameController, phoneController, registerController);
      }
    },
    cancelButton: 'No',
    buttonName: 'Yes',
  );
}

void clearFilds(
  TextEditingController nameController,
  TextEditingController phoneController,
  RegisterController registerController,
) {
  nameController.clear();
  phoneController.clear();
  registerController.selectedPosition.value = '';
}
