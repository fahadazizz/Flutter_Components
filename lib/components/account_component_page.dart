import 'package:flutter/material.dart';
import 'package:flutter_components/components/Account/password_authenticator_field.dart';

import '../main_button.dart';

class AccountComponentPage extends StatelessWidget {
  const AccountComponentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // list of account buttons
    List<MainButton> accountButton = [
      MainButton(
        data: 'Password Authenticator Field',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasswordAuthenticatorField(),
            ),
          );
        },
      ),
    ];

    // main code
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccountComponentPage'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6),
        child: ListView.builder(
          itemCount: accountButton.length,
          itemBuilder: (context, index) {
            return accountButton[index];
          },
        ),
      ),
    );
  }
}
