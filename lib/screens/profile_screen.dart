import 'package:flutter/material.dart';

import '../widgets/my_list_tile.dart';
import '../widgets/my_switch.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      height: mediaQuery.size.height * 0.4,
      width: mediaQuery.size.width,
      color: Colors.white,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            MyListTile(
              icon: Icons.audiotrack,
              title: 'Notification Sounds',
              subtitle: 'Wether to play sound or not.',
              trailing: MySwitch(),
            ),
            MyListTile(
              icon: Icons.notifications_active,
              title: 'Heads Up Notification',
              subtitle: 'Wether to show popup or not.',
              trailing: MySwitch(),
            ),
          ],
        ),
      ),
    );
  }
}
