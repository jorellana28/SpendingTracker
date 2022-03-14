import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  const Fab({Key? key, required this.onPressed}) : super(key: key);
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Semantics(
        button: true,
        label: "Add new post button",
        onTapHint:
            "Opens gallery to pick image then opens form to add new post",
        child: FloatingActionButton(
          onPressed: () => onPressed(),
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
