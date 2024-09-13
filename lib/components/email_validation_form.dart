import 'package:flutter/material.dart';

class EmailValidationForm extends StatefulWidget {
  @override
  _EmailValidationFormState createState() => _EmailValidationFormState();
}

class _EmailValidationFormState extends State<EmailValidationForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  Color borderColor = Colors.grey; // Initial border color

  // Email Regular Expression
  String emailPattern =
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Email Validation '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor, width: 2.0),
                  ),
                ),
                // Email Validation using RegEx
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      borderColor = Colors.red; // Set to red when invalid
                    });
                  } else if (!RegExp(emailPattern).hasMatch(value)) {
                    setState(() {
                      borderColor = Colors.red; // Set to red when invalid
                    });
                    return 'Please enter a valid email';
                  }
                  setState(() {
                    borderColor = Colors.green; // Set to green when valid
                  });
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email is valid')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: EmailValidationForm(),
    ));
