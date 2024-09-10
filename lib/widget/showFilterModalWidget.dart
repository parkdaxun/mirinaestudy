import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class showFilterModalWidget extends StatefulWidget {
  _showFilterModalWidgetState createState() => _showFilterModalWidgetState();
}

class _showFilterModalWidgetState extends State<showFilterModalWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.26,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          StatusFilterButtons(),
          InputDate(),
          SizedBox(
            height: 40,
            width: screenWidth * 0.91,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                '조회',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'NotoSansKRSemiBold',
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget StatusFilterButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('진행중'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('완료'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('시작전'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('1개월'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('6개월'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('1년'),
            ),
          ],
        ),
      ],
    );
  }

  Widget InputDate() {
    return Row(
      children: [
      ],
    );
  }
}
