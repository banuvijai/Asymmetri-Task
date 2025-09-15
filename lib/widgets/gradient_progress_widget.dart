import '../utils/imports.dart';

class GradientProgressWidget extends StatelessWidget {
  final double value;
  final Color color;
  final bool reverse;

  const GradientProgressWidget({
    super.key,
    required this.value,
    required this.color,
    this.reverse = false,
  });

  LinearGradient _getGradient(Color base, bool reverse) {
    final hsl = HSLColor.fromColor(base);
    final lighter = hsl.withLightness((hsl.lightness + 0.5).clamp(0.0, 1.0)).toColor();
    final darker = hsl.withLightness((hsl.lightness * 0.6).clamp(0.0, 1.0)).toColor();

    return LinearGradient(
      begin: reverse ? Alignment.centerRight : Alignment.centerLeft,
      end: reverse ? Alignment.centerLeft : Alignment.centerRight,
      colors: [lighter, base, darker],
    );
  }

  @override
  Widget build(BuildContext context) {
    final clamped = value.clamp(0.0, 1.0);

    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            alignment: reverse ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: constraints.maxWidth * clamped,
              decoration: BoxDecoration(
                gradient: _getGradient(color, reverse),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        },
      ),
    );
  }
}
