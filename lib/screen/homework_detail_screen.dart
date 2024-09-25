import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinaestudy/widget/app_bar.dart';

import '../colors.dart';

class HomeworkDetailScreen extends StatefulWidget {
  final String title;
  final String status;
  final String date;
  final String contents;
  final String endDate;

  const HomeworkDetailScreen({
    required this.title,
    required this.status,
    required this.date,
    required this.contents,
    required this.endDate,
  });

  @override
  _HomeworkDetailScreenState createState() => _HomeworkDetailScreenState();
}

class _HomeworkDetailScreenState extends State<HomeworkDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "과제",
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 17, right: 17, top: 22.0, bottom: 11),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontFamily: 'NotoSansKRSemiBold',
                      fontSize: 16,
                      color: AppColors.blue),
                ),
              ),
              Container(
                height: 1,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Color(0xffE5E5EA),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 23),
                      child: Text(
                        '과제 내용',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'NotoSansKRMedium',
                            color: AppColors.black),
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      widget.contents,
                      style: TextStyle(
                          fontFamily: 'NotoSansKRRegular',
                          fontSize: 15,
                          color: AppColors.black),
                    ),
                    SizedBox(height: 25),
                    Container(
                      height: 1,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Color(0xffE5E5EA),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 26, bottom: 26),
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
                                color: Color(0xffFF5C5C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Color(0xffE5E5EA),
                      ),
                    ),
                    SizedBox(height: 33),
                    Text(
                      '과제 제출',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'NotoSansKRSemiBold',
                          color: AppColors.blue),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 9),
                      child: Text(
                        '파일 업로드*',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'NotoSansKRMedium',
                            color: AppColors.black),
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xffD4D8E0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 21, top: 12, bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/icons/file_upload_icon.png'),
                            SizedBox(width: 9),
                            Text(
                              '파일 선택',
                              style: TextStyle(
                                  fontFamily: 'NotoSansKRRegular',
                                  fontSize: 15,
                                  color: Color(0xffD4D8E0)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 9),
                      child: Text(
                        '내용',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'NotoSansKRMedium',
                            color: AppColors.black),
                      ),
                    ),
                    TextField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: '내용을 입력해주세요.',
                        hintStyle: TextStyle(color: Color(0xffD4D8E0), fontSize: 15),
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffD4D8E0), width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffD4D8E0), width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffD4D8E0), width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      scrollPadding: EdgeInsets.only(bottom: 100+MediaQuery.of(context).viewInsets.bottom),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20+(MediaQuery.of(context).viewInsets.bottom),),
            ],
          ),
        ),
      ),
    );
  }
}
