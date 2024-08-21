import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 55,
              height: 55,
              child: Image.asset('assets/images/google_logo.png'),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF371E56).withOpacity(0.1), // 그림자의 색상과 투명도
                    blurRadius: 9.2, // 그림자의 흐림 반경
                    spreadRadius: 0, // 그림자의 확산 반경
                    offset: Offset(0, 4), // 그림자의 위치 (x, y)
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 55,
            height: 55,
            child: Image.asset('assets/images/microsoft_logo.png'),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF371E56).withOpacity(0.1), // 그림자의 색상과 투명도
                  blurRadius: 9.2, // 그림자의 흐림 반경
                  spreadRadius: 0, // 그림자의 확산 반경
                  offset: Offset(0, 4), // 그림자의 위치 (x, y)
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 55,
              height: 55,
              child: Image.asset('assets/images/naver_logo.png'),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF371E56).withOpacity(0.1), // 그림자의 색상과 투명도
                    blurRadius: 9.2, // 그림자의 흐림 반경
                    spreadRadius: 0, // 그림자의 확산 반경
                    offset: Offset(0, 4), // 그림자의 위치 (x, y)
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 55,
            height: 55,
            child: Image.asset('assets/images/kakao_logo.png'),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF371E56).withOpacity(0.1), // 그림자의 색상과 투명도
                  blurRadius: 9.2, // 그림자의 흐림 반경
                  spreadRadius: 0, // 그림자의 확산 반경
                  offset: Offset(0, 4), // 그림자의 위치 (x, y)
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}