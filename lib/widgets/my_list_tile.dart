import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget trailing;

  MyListTile({
    @required this.icon,
    @required this.title,
    @required this.subtitle,
    @required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
        size: 35,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.title.copyWith(
              color: Colors.black,
              fontSize: 18.0,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.subtitle,
      ),
      trailing: trailing,
    );
  }
}
