import '../utils/imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final contentWidth = ResponsiveUtils.getContentWidth(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F3F9),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: contentWidth,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: const [
                    SizedBox(height: 30),
                    LogoWidget(),
                    SizedBox(height: 20),
                    ColorDropdownWidget(),
                    SizedBox(height: 12),
                    SliderWidget(),
                    SizedBox(height: 12),
                    TextFieldWidget(),
                    SizedBox(height: 12),
                    ReverseSwitchWidget(),
                    SizedBox(height: 22),
                  ],
                ),
              ),
              const ProgressGridWidget(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
