import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class showFilterModalWidget extends StatefulWidget {
  final bool statusFilter;

  const showFilterModalWidget({
    Key? key,
    required this.statusFilter,
  }): super(key: key);

  _showFilterModalWidgetState createState() => _showFilterModalWidgetState();
}

class _showFilterModalWidgetState extends State<showFilterModalWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xffE2E2E2),
            width: 0.5,
          )
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatusFilterButtons(),
            Padding(
              padding: const EdgeInsets.only(top: 17, bottom: 22),
              child: InputDate(),
            ),
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
      ),
    );
  }

  Widget StatusFilterButtons() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonPaddings = (screenWidth - screenWidth * 0.91) / 2;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: buttonPaddings,
            right: buttonPaddings,
          ),
          child: SizedBox(
            child: SizedBox(
              child: widget.statusFilter ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          '진행중',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NotoSansKRSemiBold',
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Color(0xff97E107),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          '완료',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansKRSemiBold',
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Color(0xffBAB8B8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          '시작전',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansKRSemiBold',
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ): SizedBox.shrink(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 9, left: buttonPaddings, right: buttonPaddings),
          child: SizedBox(
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: AppColors.grey,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        '1개월',
                        style: TextStyle(
                            color: AppColors.grey,
                            fontFamily: 'NotoSansKRSemiBold',
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: AppColors.grey,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        '6개월',
                        style: TextStyle(
                            color: AppColors.grey,
                            fontFamily: 'NotoSansKRSemiBold',
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: AppColors.grey,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        '1년',
                        style: TextStyle(
                            color: AppColors.grey,
                            fontFamily: 'NotoSansKRSemiBold',
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget InputDate() {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonPaddings = (screenWidth - screenWidth * 0.91) / 2;

    return SizedBox(
      height: 34,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: buttonPaddings, right: 9),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2, horizontal: 11),
                  hintText: '2024.07.11',
                  hintStyle: TextStyle(
                    color: Color(0xffC1C3C7),
                    fontSize: 13,
                    fontFamily: 'NotoSansKRRegular',
                  ),
                  filled: true,
                  fillColor: Color(0xffF2F4F6),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Text(
            '~',
            style: TextStyle(
              fontFamily: 'NotoSansKRSemiBold',
              color: AppColors.black,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 9, right: buttonPaddings),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2, horizontal: 11),
                  hintText: '2024.09.11',
                  hintStyle: TextStyle(
                    color: Color(0xffC1C3C7),
                    fontSize: 13,
                    fontFamily: 'NotoSansKRRegular',
                  ),
                  filled: true,
                  fillColor: Color(0xffF2F4F6),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
