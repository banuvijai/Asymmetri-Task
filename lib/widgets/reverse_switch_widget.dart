import '../utils/imports.dart';


class ReverseSwitchWidget extends StatelessWidget {
  const ReverseSwitchWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    return Obx(() =>Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Reverse',style: TextStyle(color: controller.selectedColor.value,
        fontWeight: FontWeight.bold),),
        const SizedBox(width: 8),
         Switch(
          value: controller.reverse.value,
          activeColor: controller.selectedColor.value,
          onChanged: controller.toggleReverse,
        ),
      ],
    ),
         );
  }
}