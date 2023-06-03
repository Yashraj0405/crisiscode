import 'dart:io';

import 'package:flutter/material.dart';
import 'package:crisis_code/widgets/profile_listTile.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/Profile';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    File _profileImage = arguments['arg1'] as File;
    TextEditingController _name = arguments['arg2'] as TextEditingController;
    TextEditingController _mail = arguments['arg3'] as TextEditingController;
    TextEditingController _number = arguments['arg4'] as TextEditingController;
    TextEditingController _address = arguments['arg5'] as TextEditingController;
    TextEditingController _emergencyContact1 =
        arguments['arg6'] as TextEditingController;
    TextEditingController _emergencyContact2 =
        arguments['arg7'] as TextEditingController;
    TextEditingController _age = arguments['arg8'] as TextEditingController;
    String _selectGender = arguments['arg9'] as String;
    String _selectBloodGroup = arguments['arg10'] as String;

    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
              child: Text(
                'Profile',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      backgroundImage: FileImage(_profileImage),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'Hello',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      subtitle: Text(
                        _name.text.toString(),
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(0),
                ),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only( right: 15, left: 15),
                    child: SingleChildScrollView(
                      child: 
                        Column(
                          children: [
                            ProfileListTile(
                              'Email Address',
                              _mail.text.toString(),
                            ),
                            ProfileListTile(
                              'Contact Number',
                              _number.text.toString(),
                            ),
                            ProfileListTile(
                              'Address',
                              _address.text.toString(),
                            ),
                            ProfileListTile(
                              'Age',
                              _age.text.toString(),
                            ),
                            ProfileListTile(
                              'Gender',
                              _selectGender.toString(),
                            ),
                            ProfileListTile(
                              'Blood Group',
                              _selectBloodGroup.toString(),
                            ),
                            ProfileListTile(
                              'Emergency Conatact 1',
                              _emergencyContact1.text.toString(),
                            ),
                            ProfileListTile(
                              'Emergency Contact 2',
                              _emergencyContact2.text.toString(),
                            ),
                          ],
                        ),
                      
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
