import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class SearchResultWidget extends StatefulWidget {
  @override
  _SearchResultWidgetState createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SearchBarWidget(),
        ],
    );
  }

  Widget SearchBarWidget() {
    return Container(
      height: 47,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                color: Color(0xffE5E5EA),
                width: 1,
              )
          )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 11, bottom: 11, left: 3, right: 3),
        child: TextField(
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            hintText: '수업명 입력',
            hintStyle: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 14, color: Color(0xffD7DBE4)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            suffixIcon: Container(
              width: 18, height: 18,
              child: SvgPicture.asset(width: 18, height: 18, fit: BoxFit.contain, 'assets/images/icons/search_icon.svg'),
            ),
          ),
        ),
      ),
    );
  }
}