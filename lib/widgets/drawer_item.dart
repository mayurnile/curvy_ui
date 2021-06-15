import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final Function onPressed;
  final int myIndex, selectedIndex;

  DrawerItem({
    @required this.text,
    @required this.onPressed,
    @required this.myIndex,
    @required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          myIndex == selectedIndex
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).primaryColor,
                  ),
                  height: 10,
                  width: 10,
                )
              : SizedBox.shrink(),
          FlatButton(
            child: Text(
              text,
              style: Theme.of(context).textTheme.button,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
