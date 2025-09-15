import '../utils/imports.dart';

class ProgressGridWidget extends StatelessWidget {
  const ProgressGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();

    return Obx(() {
      final total = controller.totalItems.value;
      final perRow = controller.itemsInLine.value;
      final color = controller.selectedColor.value;
      final reverse = controller.reverse.value;
      final progress = controller.progressValue.value;

      final itemsPerRow = (perRow < 1) ? 1 : perRow;
      const spacing = 12.0;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final rowWidth = constraints.maxWidth;
            final totalSpacing = (itemsPerRow - 1) * spacing;
            final itemWidth =
                (rowWidth - totalSpacing) / itemsPerRow;

            final rows = <Widget>[];
            for (int start = 0; start < total; start += itemsPerRow) {
              final end = (start + itemsPerRow < total)
                  ? start + itemsPerRow
                  : total;
              final count = end - start;

              final rowItems = List.generate(count, (i) {
                return SizedBox(
                  width: itemWidth,
                  child: GradientProgressWidget(
                    value: progress,
                    color: color,
                    reverse: reverse,
                  ),
                );
              });

              rows.add(Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: count == itemsPerRow
                      ? MainAxisAlignment.start : MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < rowItems.length; i++) ...[
                      if (i > 0) SizedBox(width: spacing),
                      rowItems[i],
                    ]
                  ],
                ),
              ));
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: rows,
            );
          },
        ),
      );
    });
  }
}
