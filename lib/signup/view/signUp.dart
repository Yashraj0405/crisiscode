import 'package:crisis_code/login_screen/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:core';
import 'package:image_picker/image_picker.dart';
import 'package:crisis_code/constants/constants.dart';
import 'package:crisis_code/profile_screen/view/profile_screen.dart';
import 'package:crisis_code/widgets/signUp_textform.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _showPassword = true;
  Color _iconColor = Colors.grey;
  IconData _visiblityIcon = Icons.visibility_off;
  File? _profileImage;

  TextEditingController _name = TextEditingController();
  TextEditingController _mail = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _bloodGroup = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _emergencyContact1 = TextEditingController();
  TextEditingController _emergencyContact2 = TextEditingController();
  TextEditingController _specificMedicalCondition = TextEditingController();
  TextEditingController _Message = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _mailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  // final _genderFocusNode = FocusNode();
  // final _bloodGroupFocusNode = FocusNode();
  final _ageFocusNode = FocusNode();
  final _emergencyContactFocusNode1 = FocusNode();
  final _emergencyContactFocusNode = FocusNode();
  final _specificMedicalConditionFocusNode = FocusNode();
  final _messageFocusNode = FocusNode();

  Future<void> _selectProfilePicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  String? _selectGender;
  String? _selectBloodGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/motocross_india_logo.png',
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Sign Up and Get Started',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Scrollbar(
                  radius: Radius.circular(5),
                  thickness: 3,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey, width: 1)),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (_profileImage == null)
                              Center(
                                child: InkWell(
                                  onTap: _selectProfilePicture,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: CircleAvatar(
                                      radius: 75,
                                      backgroundColor: Colors.white,
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.person_outlined,
                                            size: 100,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            'Click to add image',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            else
                              Center(
                                child: InkWell(
                                  onTap: _selectProfilePicture,
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 2, color: Colors.black),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: CircleAvatar(
                                            radius: 150,
                                            backgroundColor: Colors.transparent,
                                            foregroundColor: Colors.white,
                                            backgroundImage:
                                                FileImage(_profileImage!),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(height: 16),
                            Divider(),
                            SignUp_TextForm(
                              title: 'Name',
                              controller: _name,
                              validatorMessage: 'Enter Name',
                              lengthLimitingTextInputFormatter: 20,
                              regExPattern: "[a-zA-Z ]",
                              textInputType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              formHintText: 'Enter Name',
                              focusNode: _nameFocusNode,
                              requestFocus: _mailFocusNode,
                            ),
                            // SignUp_TextForm(
                            //     title: 'Email',
                            //     controller: _mail,
                            //     validatorMessage: 'Enter Email',
                            //     lengthLimitingTextInputFormatter: 35,
                            //     regExPattern: r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            //     textInputType: TextInputType.emailAddress,
                            //     textInputAction: TextInputAction.next,
                            //     formHintText: 'Enter Email',
                            //     focusNode: _mailFocusNode,
                            //     requestFocus: _phoneFocusNode),

                            Text(
                              'E-mail',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: _mail,
                              validator: (value) {
                                if (_mail.text.isEmpty) {
                                  showMessage('Email is required');
                                }
                                return null;
                              },
                              // inputFormatters: [
                              //   //  LengthLimitingTextInputFormatter(20),
                              //   FilteringTextInputFormatter.allow(
                              //       RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'))
                              // ],
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              focusNode: _mailFocusNode,
                              decoration: InputDecoration(
                                  hintText: 'Enter E-mail ',
                                  border: InputBorder.none),
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_phoneFocusNode);
                              },
                            ),
                            Divider(),
                            SignUp_TextForm(
                                title: 'Phone',
                                controller: _phone,
                                validatorMessage: 'Enter number',
                                lengthLimitingTextInputFormatter: 10,
                                regExPattern:
                                    r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$',
                                textInputType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                formHintText: 'Enter Number',
                                focusNode: _phoneFocusNode,
                                requestFocus: _passwordFocusNode),
                            Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: _password,
                              validator: (value) {
                                if (_password.text.isEmpty) {
                                  showMessage('Enter password');
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s'))
                              ],
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              focusNode: _passwordFocusNode,
                              obscureText: _showPassword,
                              decoration: InputDecoration(
                                hintText: 'Enter Password ',
                                border: InputBorder.none,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        _showPassword = !_showPassword;
                                        _iconColor = _showPassword
                                            ? Colors.grey
                                            : Colors.orange;
                                        _visiblityIcon = _showPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility;
                                      },
                                    );
                                  },
                                  child:
                                      Icon(_visiblityIcon, color: _iconColor),
                                ),
                              ),
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_addressFocusNode);
                              },
                            ),
                            Divider(),
                            Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (_address.text.isEmpty) {
                                  showMessage('Enter address');
                                }
                              },
                              controller: _address,
                              keyboardType: TextInputType.streetAddress,
                              textInputAction: TextInputAction.done,
                              focusNode: _addressFocusNode,
                              maxLines: 3,
                              decoration: InputDecoration(
                                  hintText: 'Enter Address ',
                                  border: InputBorder.none),
                            ),
                            Divider(),
                            Text(
                              'Gender',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Select Gender',
                              ),
                              value: _selectGender,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Male'),
                                  value: 'Male',
                                ),
                                DropdownMenuItem(
                                  child: Text('Female'),
                                  value: 'Female',
                                ),
                                DropdownMenuItem(
                                  child: Text('Other'),
                                  value: 'Other',
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    _selectGender = newValue;
                                  },
                                );
                              },
                              
                            ),
                            Divider(),
                            Text(
                              'Blood Grop',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Select Bloodgroup'),
                              value: _selectBloodGroup,
                              items: [
                                DropdownMenuItem(
                                  child: Text('A+'),
                                  value: 'A+',
                                ),
                                DropdownMenuItem(
                                  child: Text('A-'),
                                  value: 'A-',
                                ),
                                DropdownMenuItem(
                                  child: Text('B+'),
                                  value: 'B+',
                                ),
                                DropdownMenuItem(
                                  child: Text('A-'),
                                  value: 'B-',
                                ),
                                DropdownMenuItem(
                                  child: Text('AB+'),
                                  value: 'AB+',
                                ),
                                DropdownMenuItem(
                                  child: Text('AB-'),
                                  value: 'AB-',
                                ),
                                DropdownMenuItem(
                                  child: Text('O+'),
                                  value: 'O+',
                                ),
                                DropdownMenuItem(
                                  child: Text('O-'),
                                  value: 'O-',
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    _selectBloodGroup = newValue;
                                  },
                                );
                              },
                            ),
                            Divider(),
                            SignUp_TextForm(
                                title: 'Emergency Contact 1',
                                controller: _emergencyContact1,
                                validatorMessage: 'Enter Number',
                                lengthLimitingTextInputFormatter: 10,
                                regExPattern: r'[0-9]+',
                                textInputType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                formHintText: 'Enter Number',
                                focusNode: _emergencyContactFocusNode1,
                                requestFocus: _emergencyContactFocusNode),
                            SignUp_TextForm(
                                title: 'Emergency Contact 2',
                                controller: _emergencyContact2,
                                validatorMessage: 'Enter Number',
                                lengthLimitingTextInputFormatter: 10,
                                regExPattern: r'[0-9]+',
                                textInputType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                formHintText: 'Enter Number',
                                focusNode: _emergencyContactFocusNode,
                                requestFocus: _ageFocusNode),
                            SignUp_TextForm(
                                title: 'age',
                                controller: _age,
                                validatorMessage: 'Enter Age',
                                lengthLimitingTextInputFormatter: 3,
                                regExPattern: r'[0-9]+',
                                textInputType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                formHintText: 'Enter Age',
                                focusNode: _ageFocusNode,
                                requestFocus:
                                    _specificMedicalConditionFocusNode),
                            SignUp_TextForm(
                                title: 'Specific Mediacal condition',
                                controller: _specificMedicalCondition,
                                validatorMessage:
                                    'Enter Specific Medical Condition',
                                lengthLimitingTextInputFormatter: 50,
                                regExPattern: "[a-zA-Z ]",
                                textInputType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                formHintText: 'Enter here',
                                focusNode: _specificMedicalConditionFocusNode,
                                requestFocus: _messageFocusNode),
                            Text(
                              'Message',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: _Message,
                              validator: (value) {
                                if (_Message.text.isEmpty) {
                                  showMessage('Enter Message');
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              focusNode: _messageFocusNode,
                              decoration: InputDecoration(
                                  hintText: 'Enter here',
                                  border: InputBorder.none),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(ProfileScreen.routeName, arguments: {
                      'arg1': _profileImage,
                      'arg2': _name,
                      'arg3': _mail,
                      'arg4': _phone,
                      'arg5': _address,
                      'arg6': _emergencyContact1,
                      'arg7': _emergencyContact2,
                      'arg8': _age,
                      'arg9': _selectGender,
                      'arg10': _selectBloodGroup
                    });
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Login.routeName);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
