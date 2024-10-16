import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mirinaestudy/screen/homework/comment_detail_screen.dart';
import 'package:mirinaestudy/screen/homework/homework_detail_screen.dart';

import '../colors.dart';

class HomeworkListWidget extends StatefulWidget {
  final String title;
  final String status;
  final String date;
  final String contents;
  final String endDate;

  const HomeworkListWidget({
    Key? key,
    required this.title,
    required this.status,
    required this.date,
    required this.contents,
    required this.endDate,
  }) : super(key: key);

  @override
  _HomeworkListWidgetState createState() => _HomeworkListWidgetState();
}

class _HomeworkListWidgetState extends State<HomeworkListWidget> {
  bool isExpanded = false; // 확장 여부를 결정하는 변수

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Color statusColor;
    Color statusTextColor;

    // 상태에 따라 색상을 설정
    switch (widget.status) {
      case "완료":
        statusColor = Color(0xffD3F682);
        statusTextColor = Color(0xff5F9F00);
        break;
      case "진행중":
        statusColor = Color(0xffB5DDFF);
        statusTextColor = Color(0xff0078DE);
        break;
      case "시작전":
        statusColor = Color(0xffE3E3E3);
        statusTextColor = AppColors.black;
        break;
      default:
        statusColor = Colors.white;
        statusTextColor = Colors.white;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: screenWidth * 0.91,
      // height: isExpanded ? screenHeight * 0.2 : screenHeight * 0.11,
      // 상태에 따라 높이 변경
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff898989).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 9.2,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontFamily: 'NotoSansKRSemiBold',
                    color: AppColors.black,
                    fontSize: 17,
                  ),
                ),
                Container(
                  width: 79,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.status,
                    style: TextStyle(
                      fontFamily: 'NotoSansKRRegular',
                      fontSize: 12,
                      color: statusTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 18, top: 9, right: 18, bottom: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.date,
                  style: TextStyle(
                    fontFamily: 'NotoSansKRRegular',
                    color: AppColors.grey,
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded; // 확장 상태를 토글
                    });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          '상세보기',
                          style: TextStyle(
                            fontFamily: 'NotoSansKRRegular',
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7.5),
                          child: SvgPicture.asset(
                              'assets/images/icons/dropdown_icon.svg'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isExpanded) // 확장 상태일 때만 표시되는 텍스트
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      '과제 내용',
                      style: TextStyle(
                          color: AppColors.blue,
                          fontFamily: 'NotoSansKRMedium'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, top: 12, right: 18),
                    child: Text(
                      widget.contents,
                      style: TextStyle(
                        fontFamily: 'NotoSansKRRegular',
                        color: AppColors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 27),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '마감 날짜 : ',
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: 'NotoSansKRRegular',
                            ),
                          ),
                          TextSpan(
                              text: widget.endDate,
                              style: TextStyle(
                                  fontFamily: 'NotoSansKRRegular',
                                  fontSize: 14,
                                  color: Color(0xffFF5C5C))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28, bottom: 27),
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 38,
                        width: screenWidth * 0.39,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => HomeworkDetailScreen(
                              title: widget.title,
                              status: widget.status,
                              date: widget.date,
                              contents: widget.contents,
                              endDate: widget.endDate,),
                            );
                          },
                          child: Text(
                            '과제 제출',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansKRSemiBold',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: screenWidth * 0.91,
                    color: Color(0xffE5E5EA),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/icons/heart_icon.svg'),
                        SizedBox(width: 5),
                        Text('좋아요',
                            style: TextStyle(
                                fontFamily: 'NotoSansKRMedium',
                                fontSize: 13,
                                color: AppColors.grey)),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => CommentDetailScreen(
                              title: widget.title,
                              date: widget.date,
                              contents: widget.contents,
                              endDate: widget.endDate,
                            ));
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/icons/comment_icon.svg'),
                                SizedBox(width: 5),
                                Text('댓글',
                                    style: TextStyle(
                                        fontFamily: 'NotoSansKRMedium',
                                        fontSize: 13,
                                        color: AppColors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
