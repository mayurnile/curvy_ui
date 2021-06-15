import 'package:flutter/material.dart';

class MyOutlineButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  MyOutlineButton({
    @required this.child,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: Theme.of(context).canvasColor,
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
