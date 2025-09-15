import '../utils/imports.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();

    return Obx(() {
      return Slider(
        value: controller.speed.value,
        onChanged: (v) => controller.setSpeed(v),
        activeColor: controller.selectedColor.value,
        inactiveColor: Colors.grey.shade300,
        min: 0.1,
        max: 1.0,
      );
    });
  }
}
