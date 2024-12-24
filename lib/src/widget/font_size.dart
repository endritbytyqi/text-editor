import 'package:flutter/material.dart';
import 'package:text_editor/text_editor_data.dart';

class FontSize extends StatelessWidget {
  final double minFontSize;
  final double maxFontSize;

  FontSize({required this.minFontSize, required this.maxFontSize});

  @override
  Widget build(BuildContext context) {
    final model = TextEditorData.of(context).textStyleModel;

    return GestureDetector(
      onScaleUpdate: (details) {
        double scale = details.scale;
        double currentFontSize = model.textStyle?.fontSize ?? minFontSize;
        double newFontSize = currentFontSize * scale;

        // Clamp the new font size between minFontSize and maxFontSize
        newFontSize = newFontSize.clamp(minFontSize, maxFontSize);

        // Update the font size in the model
        model.editFontSize(newFontSize);

        // Debugging output
        print("onScaleUpdate called, scale: $scale");
        print("Updated font size: $newFontSize");
      },
      child: Container(
        color:
        Colors.transparent, // Ensure the GestureDetector captures the input
      ),
    );
  }
}
