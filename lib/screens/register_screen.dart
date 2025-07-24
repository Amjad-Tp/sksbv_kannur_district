import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksbv_kannur_jilla/controller/register_controller.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';
import 'package:sksbv_kannur_jilla/functions/custom_button.dart';
import 'package:sksbv_kannur_jilla/functions/maps.dart';
import 'package:sksbv_kannur_jilla/functions/register_member.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_appbar.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_container.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_text_field.dart';

class RegisterationScreen extends StatelessWidget {
  final String zoneName;
  final String zoneId;
  const RegisterationScreen({
    super.key,
    required this.zoneName,
    required this.zoneId,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    final registerController = Get.put(RegisterController());
    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'Registeration'),
          Expanded(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Padding(
                  padding: screenPadding,
                  child: Column(
                    children: [
                      Text(
                        'Zone (മേഖല) - ${zoneName.toUpperCase()}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      cSizedBox20,
                      //---name text field
                      CustomTextField(
                        controller: nameController,
                        labelText: 'Name',
                        hintText: 'Name',
                      ),
                      cSizedBox20,

                      /// Position Container
                      Obx(
                        () => _buildContainerForZonePosition(
                          controller: registerController,
                        ),
                      ),
                      cSizedBox30,
                      //---- Register button
                      buildThemeTextButton(
                        function: () {
                          registerMember(
                            context,
                            nameController,
                            registerController,
                            zoneName,
                            zoneId,
                          );
                        },
                        name: "Register",
                      ),

                      cSizedBox20,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //----------Container for zone and position
  CustomContainer _buildContainerForZonePosition({
    required RegisterController controller,
  }) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose Position (മേഖല സ്ഥാനം)',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          cSizedBox10,
          CustomTextField(
            readOnly: true,
            controller: TextEditingController(
              text: controller.selectedPosition.value,
            ),
            hintText: 'Choose Position',
          ),
          cSizedBox15,
          _buildChoiceChips(controller),
        ],
      ),
    );
  }

  //---------ChoiceChips.....
  Wrap _buildChoiceChips(RegisterController controller) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: positions.map((pos) {
        final isSelected = controller.selectedPosition.value == pos;
        return ChoiceChip(
          label: Text(pos, style: const TextStyle(fontSize: 13)),
          selected: isSelected,
          selectedColor: purple,
          backgroundColor: lightGreyColor,
          checkmarkColor: whiteColor,
          onSelected: (selected) {
            if (selected) {
              controller.selectPosition(pos);
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: transparent),
          ),
          labelStyle: TextStyle(color: isSelected ? whiteColor : blackColor),
        );
      }).toList(),
    );
  }
}
