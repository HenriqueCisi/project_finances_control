import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final TextInputType keyboardType;

  const AdaptativeTextField(
      this.text, this.controller, this.keyboardType, this.onSubmitted,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(
            bottom: 10
          ),
          child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              placeholder: text,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12
              ),
            ),
        )
        : TextField(
            decoration: InputDecoration(labelText: text),
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted
            );
  }
}
