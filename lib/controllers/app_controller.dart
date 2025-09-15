import '../utils/imports.dart';

class AppController extends GetxController {

  final RxInt totalItems = 1.obs;
  final RxInt itemsInLine = 1.obs;
  final Rx<Color> selectedColor = Colors.green.obs;
  final RxBool reverse = false.obs;

  final RxDouble progressValue = 0.0.obs;
  final RxDouble speed = 0.5.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startProgressLoop();
  }

  void _startProgressLoop() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 40), (_) {
      final increment = 0.002 + (speed.value * 0.02);
      progressValue.value += increment;
      if (progressValue.value > 1.0) progressValue.value = 0.0;
    });
  }


  void setTotalItems(int value) {
    totalItems.value = (value < 1) ? 1 : value;
  }

  void setItemsInLine(int value) {
    itemsInLine.value = (value < 1) ? 1 : value;
  }


  void setSpeed(double v) {
    speed.value = v.clamp(0.0, 1.0);
  }

  void updateColor(Color color) {
    selectedColor.value = color;
  }


  void setColor(Color color) => updateColor(color);

  void toggleReverse(bool val) {
    reverse.value = val;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
