import 'package:crisis_code/signup/view/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crisis_code/constants/constants.dart';
import 'package:crisis_code/qr_screen/view/qr_screen.dart';

class Login extends StatefulWidget {
  static const routeName = '/Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _passwordFocusNode = FocusNode();

  TextEditingController _mailPhone = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool showPassword = true;
  Color _iconColor = Colors.grey;
  IconData _visiblityIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/motocross_india_logo.png',
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Enter your login details to proceed.',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.grey, width: 1)),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login/Phone',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            controller: _mailPhone,
                            validator: (value) {
                              if (_mailPhone.text.isEmpty) {
                                showMessage('Email is required');
                              }
                              return null;
                            },
                            inputFormatters: [
                              //  LengthLimitingTextInputFormatter(20),
                              FilteringTextInputFormatter.allow(RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'))
                            ],
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Registered email or phone'),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                          ),
                          Divider(),
                          Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            obscureText: showPassword,
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
                            focusNode: _passwordFocusNode,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter password',
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      showPassword = !showPassword;
                                      _iconColor = showPassword
                                          ? Colors.grey
                                          : Colors.orange;
                                      _visiblityIcon = (showPassword
                                          ? Icons.visibility_off
                                          : Icons.visibility);
                                    },
                                  );
                                },
                                child: Icon(
                                  _visiblityIcon,
                                  color: _iconColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Login with OTP',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(QRScreen.routeName);
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignUp.routeName);
                        },
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
