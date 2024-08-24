import 'package:flutter/material.dart';

class PasswordAuthenticatorField extends StatefulWidget {
  @override
  State<PasswordAuthenticatorField> createState() =>
      _PasswordAuthenticatorFieldState();
}

class _PasswordAuthenticatorFieldState
    extends State<PasswordAuthenticatorField> {
  final textController = TextEditingController();

  bool isSpecialCharacter = false;
  bool isUpperCaseLetter = false;
  bool isLengthGood = false;
  bool isAnyNumber = false;

  void checkAuth(String value) {
    setState(() {
      isSpecialCharacter =
          value.contains(RegExp(r'[!@#\$%^&*()_+{}\[\]:;"\<>,.?/|\\]'));
      isUpperCaseLetter = value.contains(RegExp(r'[A-Z]'));
      isAnyNumber = value.contains(RegExp(r'[0-9]'));
      isLengthGood = value.length >= 6 && value.length <= 12;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PasswordAuthenticatorField'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 6, right: 6),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: 'Enter any text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: checkAuth,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _rowCheckAuth(
                isUpperCaseLetter
                    ? Icon(
                        Icons.circle,
                        color: Colors.amber,
                      )
                    : Icon(Icons.circle_outlined),
                'Any upperCase letter',
              ),
              _rowCheckAuth(
                isSpecialCharacter
                    ? Icon(
                        Icons.circle,
                        color: Colors.amber,
                      )
                    : Icon(Icons.circle_outlined),
                'Any Special letter',
              ),
              _rowCheckAuth(
                isAnyNumber
                    ? Icon(
                        Icons.circle,
                        color: Colors.amber,
                      )
                    : Icon(Icons.circle_outlined),
                'Any number 0-9',
              ),
              _rowCheckAuth(
                isLengthGood
                    ? Icon(
                        Icons.circle,
                        color: Colors.amber,
                      )
                    : Icon(Icons.circle_outlined),
                'Length range > 6 and < 12',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowCheckAuth(Icon icon, String text) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.2, top: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          SizedBox(
            width: 5,
          ),
          Text('$text'),
        ],
      ),
    );
  }
}
