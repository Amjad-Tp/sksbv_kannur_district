import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksbv_kannur_jilla/controller/register_controller.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';
import 'package:sksbv_kannur_jilla/functions/custom_button.dart';
import 'package:sksbv_kannur_jilla/functions/register_member.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_appbar.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_container.dart';
import 'package:sksbv_kannur_jilla/widgets/custom_text_field.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    List<String> zones = [
      "Payyannur",
      "Madayi",
      "Thalipparamba",
      "Sreekandapuram",
      "Kambil",
      "Kannur",
      "Mowanchery",
      "Iritty",
      "Panur",
      "Thalasseri",
    ];

    List<String> positions = [
      "President",
      "JN. Secretary",
      "Treasurer",
      "Working Secretary",
      "Vice.President",
      "Join. Secretary",
      "Tech Admin",
      "Khidma Coordinator",
      "Adab Coordinator",
      "Alif Coordinator",
    ];

    final controller = Get.put(RegisterController());
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
                      const Text(
                        'Register Here',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      cSizedBox20,
                      //---name text field
                      CustomTextField(
                        controller: nameController,
                        labelText: 'Name',
                        hintText: 'Name',
                      ),
                      cSizedBox20,
                      //--- Zone container
                      Obx(
                        () => _buildContainerForZonePosition(
                          controller: controller,
                          items: zones,
                          title: 'Choose Zone (മേഖല)',
                          hintText: 'Choose Zone',
                          selectedText: controller.selectedZone.value,
                          onItemSelected: (zone) =>
                              controller.selectMeghala(zone),
                        ),
                      ),
                      cSizedBox20,

                      /// Position Container
                      Obx(
                        () => _buildContainerForZonePosition(
                          controller: controller,
                          items: positions,
                          title: 'Choose Position (മേഖല സ്ഥാനം)',
                          hintText: 'Choose Position',
                          selectedText: controller.selectedPosition.value,
                          onItemSelected: (pos) =>
                              controller.selectPosition(pos),
                        ),
                      ),
                      cSizedBox30,
                      //---- Register button
                      buildThemeTextButton(
                        function: () {
                          final name = nameController.text.trim();
                          final zone = controller.selectedZone.value;
                          final position = controller.selectedPosition.value;

                          registerMember(context, name, zone, position);
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
    required List<String> items,
    required String title,
    required String hintText,
    required String selectedText,
    required Function(String) onItemSelected,
  }) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          cSizedBox10,
          CustomTextField(
            readOnly: true,
            controller: TextEditingController(text: selectedText),
            hintText: hintText,
          ),
          cSizedBox15,
          _buildChoiceChips(items, selectedText, onItemSelected),
        ],
      ),
    );
  }

  //---------ChoiceChips.....
  Wrap _buildChoiceChips(
    List<String> allItems,
    String selectedItem,
    Function(String) onItemSelected,
  ) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: allItems.map((item) {
        final isSelected = selectedItem == item;
        return ChoiceChip(
          label: Text(item, style: const TextStyle(fontSize: 13)),
          selected: isSelected,
          selectedColor: purple,
          backgroundColor: lightGreyColor,
          checkmarkColor: whiteColor,
          onSelected: (selected) {
            if (selected) {
              onItemSelected(item);
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
