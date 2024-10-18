import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  List<String> pin = [];
  FocusNode? pin1FocusNode;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  TextEditingController? pin1Controller;
  TextEditingController? pin2Controller;
  TextEditingController? pin3Controller;
  TextEditingController? pin4Controller;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin1Controller = TextEditingController();
    pin2Controller = TextEditingController();
    pin3Controller = TextEditingController();
    pin4Controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode!.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin1Controller!.dispose();
    pin2Controller!.dispose();
    pin3Controller!.dispose();
    pin4Controller!.dispose();
  }

  void nextField(String value, TextEditingController? prevController, TextEditingController? nextController, FocusNode? prevFocusNode, FocusNode? nextFocusNode) {
    if (value.length == 1) {
      nextFocusNode!.requestFocus();
      nextController!.selection = TextSelection(
        baseOffset: 0,
        extentOffset: nextController.text.length
      );
    } else {
      prevFocusNode!.requestFocus();
      prevController!.selection = TextSelection(
        baseOffset: 0,
        extentOffset: prevController.text.length
      );
    }
  }

  void continueFunc() {
    if (pin.length == 4) {
      log(pin.join());
      // if all are valid then go to success screen
      KeyboardUtil.hideKeyboard(context);
      Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: pin1Controller,
                  focusNode: pin1FocusNode,
                  autofocus: true,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (pin.isNotEmpty) {
                      pin[0] = value;
                    } else {
                      pin.add(value);
                    }
                    nextField(value, pin1Controller, pin2Controller, pin1FocusNode, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: pin2Controller,
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (pin.length >= 2) {
                      pin[1] = value;
                    } else {
                      pin.add(value);
                    }
                    nextField(value, pin1Controller, pin3Controller, pin1FocusNode, pin3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: pin3Controller,
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (pin.length >= 3) {
                      pin[2] = value;
                    } else {
                      pin.add(value);
                    }
                    nextField(value, pin2Controller, pin4Controller, pin2FocusNode, pin4FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: pin4Controller,
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (pin.length >= 4) {
                      pin[3] = value;
                    } else {
                      pin.add(value);
                    }
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                      continueFunc();
                    } else {
                      nextField(value, pin3Controller, pin4Controller, pin3FocusNode, pin4FocusNode);
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          ElevatedButton(
            onPressed: continueFunc,
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}
