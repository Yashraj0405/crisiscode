import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/constants.dart';

class SignUp_TextForm extends StatelessWidget {
  String title;
  TextEditingController controller = TextEditingController();
  String validatorMessage;
  int lengthLimitingTextInputFormatter;
  String regExPattern;
  TextInputType textInputType;
  TextInputAction textInputAction;
  String formHintText;
  FocusNode focusNode;
  FocusNode requestFocus;

  SignUp_TextForm({
    required this.title,
    required this.controller,
    required this.validatorMessage,
    required this.lengthLimitingTextInputFormatter,
    required this.regExPattern,
    required this.textInputType,
    required this.textInputAction,
    required this.formHintText,
    required this.focusNode,
    required this.requestFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (controller.text.isEmpty) {
              showMessage(validatorMessage);
            }
            return null;
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(lengthLimitingTextInputFormatter),
            FilteringTextInputFormatter.allow(RegExp(regExPattern))
          ],
          keyboardType: textInputType,
          textInputAction: textInputAction,
          focusNode: focusNode,
          decoration: InputDecoration(
              hintText: formHintText, border: InputBorder.none),
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(requestFocus);
          },
        ),
        Divider(),
      ],
    );
  }
}
