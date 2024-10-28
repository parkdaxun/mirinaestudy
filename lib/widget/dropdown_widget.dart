import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  List<String> items = ['교실 1', '교실 2', '교실 3', '교실 4', '교실 5'];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = items.isNotEmpty ? items[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            DropdownButton<String>(
              underline: SizedBox.shrink(), // 기본 밑줄 제거
              value: selectedValue,
              isExpanded: true,
              items: items.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        value,
                        style: TextStyle(
                          fontFamily: 'NotoSansKRMedium',
                          fontSize: 16,
                          color: selectedValue == value ? AppColors.blue : AppColors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      if (selectedValue == value)
                        SvgPicture.asset('assets/images/icons/blue_dropdown_icon.svg'),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              dropdownColor: Colors.white,
              icon: SizedBox.shrink(),
              elevation: 0,
            ),
            // 선택된 항목 아래에 줄 추가
            if (selectedValue != null)
              Container(
                height: 0.5, // 줄의 두께
                color: AppColors.lightBlue, // 줄의 색상
                width: MediaQuery.of(context).size.width,
              ),
          ],
        ),
      ),
    );
  }
}