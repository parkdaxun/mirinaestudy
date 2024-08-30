import 'package:flutter/material.dart';

import 'colors.dart';

class InputInfoTextField {
  static InputDecoration getTextFieldDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: AppColors.grey,
        fontSize: 14,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
