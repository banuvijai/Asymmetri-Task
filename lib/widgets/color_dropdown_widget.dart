import '../utils/imports.dart';

class ColorDropdownWidget extends StatelessWidget {
  const ColorDropdownWidget({super.key});

  static const List<MapEntry<String, Color>> _colorOptions = [
    MapEntry('Green', Colors.green),
    MapEntry('Blue', Colors.blue),
    MapEntry('Red', Colors.red),
    MapEntry('Purple', Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();

    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color:Colors.grey),
        ),
        child: DropdownButton<Color>(
          value: controller.selectedColor.value,
          underline: const SizedBox(),
          isExpanded: true,
          items: _colorOptions.map((entry) => DropdownMenuItem<Color>(
            value: entry.value,
            child: Text(entry.key,
                style: TextStyle(color: entry.value)),
          )).toList(),
          onChanged: (val) {
            if (val != null) controller.updateColor(val);
          },
        ),
      );
    });
  }
}
