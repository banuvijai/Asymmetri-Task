import '../utils/imports.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network('https://tinyurl.com/3hfa26cx',
        width: ResponsiveUtils.getContentWidth(context),
        height: ResponsiveUtils.getContentHeight(context) * 0.15,
        fit: BoxFit.cover,
      ),
    );
  }
}
