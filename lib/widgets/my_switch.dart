import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          isActive = !isActive;
        });
      },
      child: Container(
        width: 70,
        height: 38,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 2,
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              left: isActive ? 32 : 0 ,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 300),
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: isActive ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
