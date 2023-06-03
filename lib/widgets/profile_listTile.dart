import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  String title;
  String subtitle;

  ProfileListTile(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              subtitle,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
       Divider(height: 1),
      ],
    );
  }
}
