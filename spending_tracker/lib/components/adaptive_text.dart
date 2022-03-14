import 'package:flutter/material.dart';

class AdaptiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const AdaptiveText({Key? key, required this.text, required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textScaleFactor =
        MediaQuery.of(context).orientation == Orientation.portrait ? 1.0 : 0.75;
    return Container(
      padding: const EdgeInsets.all(4),
      child: Text(
        text,
        style: style,
        textScaleFactor: textScaleFactor,
      ),
    );
  }
}
