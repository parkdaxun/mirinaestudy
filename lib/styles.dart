import 'package:flutter/material.dart';

import 'colors.dart';

class InputInfoTextField {
  static InputDecoration InputInfoTextFieldWhite(String hintText) {
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

  static InputDecoration InputInfoTextFieldGrey(String hintText) {
    return InputDecoration(
      hintText: hintText,
      fillColor: AppColors.fillGrey,
      filled: true,
      hintStyle: TextStyle(
        color: AppColors.grey,
        fontSize: 14,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}