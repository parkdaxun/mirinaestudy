import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mirinaestudy/widget/dropdown_widget.dart';
import 'package:mirinaestudy/widget/search_result_widget.dart';

import '../colors.dart';
import '../widget/app_bar.dart';
import '../widget/lesson_list_widget.dart';

class LessonScreen extends StatefulWidget {
  _LessonScreenState createState() => _LessonScreenState();
}

class LessonList {
  String lessonName;
  String details;
  String time;

  LessonList({
    required this.lessonName,
    required this.details,
    required this.time,
  });
}

class _LessonScreenState extends State<LessonScreen> {
  bool onClicked = false;

  final List<LessonList> lessons = [
    LessonList(
        lessonName: 'Test 1',
        details: 'Unit-1',
        time: '10:30 AM',
    ),
    LessonList(
      lessonName: 'Grammar Lesson',
      details: 'Unit-2',
      time: '10:30 AM',
    ),
    LessonList(
      lessonName: 'Test 2',
      details: 'Unit-3',
      time: '10:30 AM',
    ),
    LessonList(
      lessonName: 'Listening',
      details: 'Unit-4',
      time: '10:30 AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '수업'),
      body: Stack(
        children: [
          Column(
            children: [
              DropdownWidget(),
              Expanded(
                child: onClicked
                    ? SearchResultWidget(lessonList: lessons)
                    : SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchBarWidget(),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: lessonList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          !onClicked ? Positioned(
            bottom: 28,
            right: 33,
            child: lessonAddButton(),
          ) : Container(),
        ],
      ),
    );
  }

  Widget SearchBarWidget() {
    return Container(
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
        padding: const EdgeInsets.only(top: 11, bottom: 11, right: 17, left: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('나의 수업', style: TextStyle(fontFamily: 'NotoSansKRSemiBold', fontSize: 15, color: AppColors.blue),),
            GestureDetector(
              onTap: () {
                setState(() {
                  onClicked = !onClicked;
                  print("검색");
                });
              },
              child: SvgPicture.asset('assets/images/icons/search_icon.svg'),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget lessonList() {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Center(
      child: SizedBox(
        width: screenWidth*0.91,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final lessonList = lessons[index];
            return Padding(
              key: ValueKey(lessonList),
              padding: const EdgeInsets.only(bottom: 11),
              child: LessonListWidget(
                lessonName: lessonList.lessonName,
                details: lessonList.details,
                time: lessonList.time,
              ),
            );
          },
          itemCount: lessons.length,
        ),
      ),
    );
  }

  Widget lessonAddButton() {
    return GestureDetector(
      onTap: () {
        _showMyDialog(context);
      },
      child: SizedBox(
        height: 52,
        width: 52,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Color(0xff371E56).withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 9,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Image.asset('assets/images/icons/add_icon.png'),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      bool isSubmitted = false;

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: Container(
              height: 160,
              width: MediaQuery.of(context).size.width * 0.81,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isSubmitted)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 9.0),
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                            color: Color(0xffE6F7FF),
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: SvgPicture.asset(
                              'assets/images/icons/submit_icon.svg'),
                        ),
                      ),
                    ),
                  Text(
                    isSubmitted ? '수업이 추가 되었습니다.' : '수업 코드를 입력하세요.',
                    style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 15,
                        fontFamily: 'NotoSansKRMedium'),
                  ),
                  if (!isSubmitted)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14, bottom: 23),
                          child: SizedBox(
                            height: 45,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.fillGrey,
                                hintText: '수업코드',
                                hintStyle: TextStyle(
                                    color: AppColors.grey,
                                    fontFamily: 'NotoSansKRRegular',
                                    fontSize: 14),
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
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                '취소',
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 15,
                                    fontFamily: 'NotoSansKRMedium'),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Color(0xffDEDEDE),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isSubmitted = true;
                                });

                                Future.delayed(Duration(seconds: 2), () {
                                  Get.back();
                                });
                              },
                              child: Text(
                                '확인',
                                style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 15,
                                    fontFamily: 'NotoSansKRMedium'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}