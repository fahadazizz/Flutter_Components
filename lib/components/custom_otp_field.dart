import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtpField extends StatefulWidget {
  const CustomOtpField({super.key});

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  late List<TextEditingController> _controller;
  late List<FocusNode> _focuNode;

  @override
  void initState() {
    _controller = List.generate(4, (_) => TextEditingController());
    _focuNode = List.generate(4, (_) => FocusNode());
    super.initState();
  }

  @override
  void dispose() {
    _controller = List.generate(4, (_) => TextEditingController());
    _focuNode = List.generate(4, (_) => FocusNode());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            4,
            (index) => _otpField(
              _controller[index],
              _focuNode[index],
              index,
            ),
          ),
        ),
      ),
    );
  }

  Widget _otpField(
      TextEditingController controller, FocusNode focusNode, int index) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white10,
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        focusNode: focusNode,
        maxLength: 1,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            int _index = _controller.indexOf(controller) + 1;
            if (_index < _controller.length) {
              FocusScope.of(context).requestFocus(_focuNode[_index]);
            }
          } else {
            if (index > 0) {
              FocusScope.of(context).requestFocus(_focuNode[index - 1]);
            }
          }
        },
      ),
    );
  }
}
