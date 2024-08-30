import 'package:flutter/cupertino.dart';

import '../colors.dart';

class ModifyInfoButtons extends StatelessWidget {

  final String text;
  ModifyInfoButtons({required this.text});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textFieldWidth = screenWidth * 0.84;

    return Container(
      width: textFieldWidth,
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.fillGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 13, right: 13, top: 8.5, bottom: 8.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${text}',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff7A8195),
              ),
            ),
            Image.asset('assets/images/icons/next_icon.png'),
          ],
        ),
      ),
    );
  }
}