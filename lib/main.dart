import 'utils/imports.dart';

void main() {
  Get.put(AppController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: HomeView(),
        debugShowCheckedModeBanner: false);
  }
}


