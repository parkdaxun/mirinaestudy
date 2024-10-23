import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mirinaestudy/widget/classroom_list_widget.dart';
import '../colors.dart';
import '../widget/app_bar.dart';
import '../widget/my_class_list_widget.dart';

class ClassScreen extends StatefulWidget {
  _ClassScreenState createState() => _ClassScreenState();
}

class ClassList {
  String className;
  String teacherName;
  String time;

  ClassList({
    required this.className,
    required this.teacherName,
    required this.time,
  });
}

class _ClassScreenState extends State<ClassScreen> {
  final List<ClassList> classes = [
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '수업'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClassroomListWidget(
              name: '교실 1',
              teacherName: 'Jessica Aundney',
              total: 10,
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: AppColors.fillGrey,
  //     appBar: CustomAppBar(title: '수업'),
  //     body: Stack(
  //       children: [
  //         Column(
  //           children: [
  //             Expanded(
  //               child: Padding(
  //                 padding: const EdgeInsets.only(top: 18.0),
  //                 child: classList(),
  //               ),
  //             ),
  //           ],
  //         ),
  //         Positioned(
  //           bottom: 28,
  //           right: 33,
  //           child: classAddButton(),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget classList() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: screenWidth * 0.91,
        child: ReorderableListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final classesList = classes[index];
              return Padding(
                key: ValueKey(classesList),
                padding: const EdgeInsets.only(bottom: 11),
                child: MyClassListWidget(
                  teacherName: classesList.teacherName,
                  className: classesList.className,
                  time: classesList.time,
                ),
              );
            },
            itemCount: classes.length,
            onReorder: _onReorder),
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final ClassList movedHomework = classes.removeAt(oldIndex);
      classes.insert(newIndex, movedHomework);
    });
  }

  Widget classAddButton() {
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
                          child: Image.asset(
                              'assets/images/icons/blue_filled_paper_icon.png'),
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
