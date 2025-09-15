import '../utils/imports.dart';


class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();

    return Column(
      children: [
        Obx(() => _buildField(
          label: 'Total Items',
          color: controller.selectedColor.value,
          onChanged: (val) {
            final v = int.tryParse(val) ?? 1;
            controller.setTotalItems(v);
          },
        )),
        const SizedBox(height: 12),
        Obx(() => _buildField(
          label: 'Items in Line',
          color: controller.selectedColor.value,
          onChanged: (val) {
            final v = int.tryParse(val) ?? 1;
            controller.setItemsInLine(v);
          },
        )),
      ],
    );
  }

  Widget _buildField({
    required String label,
    required Color color,
    required void Function(String) onChanged,
  }) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      cursorColor: color,
      style: TextStyle(color: color, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: color),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: color, width: 2),
        ),
      ),
    );
  }
}
