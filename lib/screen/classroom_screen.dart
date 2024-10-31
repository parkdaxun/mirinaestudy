import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mirinaestudy/widget/app_bar.dart';
import 'package:mirinaestudy/widget/classroom/student_list_widget.dart';
import 'package:mirinaestudy/widget/dropdown_widget.dart';
import 'package:mirinaestudy/widget/modalalertbox_widget.dart';

import '../colors.dart';
import '../widget/classroom/classroom_post_widget.dart';
import '../widget/classroom/document_list_widget.dart';

class ClassroomScreen extends StatefulWidget {
  _ClassroomScreenState createState() => _ClassroomScreenState();
}

class PostList {
  String name;
  String date;
  String content;
  int like;
  int comment;

  PostList({
    required this.name,
    required this.date,
    required this.content,
    required this.like,
    required this.comment,
  });
}

class DocumentList {
  String name;
  String details;
  String type;

  DocumentList({
    required this.name,
    required this.details,
    required this.type,
  });
}

class StudentList {
  String name;
  String studentNumber;
  String phoneNumber;
  String email;

  StudentList({
    required this.name,
    required this.studentNumber,
    required this.phoneNumber,
    required this.email,
  });
}

class _ClassroomScreenState extends State<ClassroomScreen> {
  int category = 1;

  final List<StudentList> students = [
    StudentList(
      name: 'Park Daeun',
      studentNumber: '111-2222-3333',
      phoneNumber: '010-1234-2344',
      email: 'parkde0207@gmail.com',
    ),
    StudentList(
      name: 'Cho Daeun',
      studentNumber: '111-2222-1234',
      phoneNumber: '010-1234-3434',
      email: 'chode0207@gmail.com',
    ),
    StudentList(
      name: 'Kim Daeun',
      studentNumber: '111-2222-7777',
      phoneNumber: '010-1234-1212',
      email: 'kimde0207@gmail.com',
    ),
    StudentList(
      name: 'Yoon Daeun',
      studentNumber: '111-2222-3567',
      phoneNumber: '010-1234-2456',
      email: 'yoonde0207@gmail.com',
    ),
  ];

  final List<PostList> posts = [
    PostList(
      name: 'Park Daeun',
      date: '2024.08.30 오후 02:28',
      content: 'This paper investigates the cognitive processes involved in English word recognition among young EFL learners using eye-tracking methodology. A quasi-experimental mixed method design was used to investigate how young.',
      like: 3,
      comment: 5,
    ),
    PostList(
      name: 'Park Daeun',
      date: '2024.08.30 오후 02:28',
      content: '안녕하세요',
      like: 3,
      comment: 5,
    ),
    PostList(
      name: 'Park Daeun',
      date: '2024.08.30 오후 02:28',
      content: '안녕하세요',
      like: 3,
      comment: 5,
    ),
  ];

  final List<DocumentList> documents = [
    DocumentList(
      name: 'Chapter 1, Lesson 5',
      details: '40KB, Microsoft edge PDF document',
      type: 'pdf',
    ),
    DocumentList(
      name: 'Chapter 2, Lesson 2',
      details: '40KB, Microsoft Word document',
      type: 'word',
    ),
    DocumentList(
      name: 'Chapter 3, Lesson 5',
      details: '40KB, Microsoft word document',
      type: 'word',
    ),
    DocumentList(
      name: 'Chapter 8, Lesson 2',
      details: '40KB, Microsoft edge PDF document',
      type: 'pdf',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: category == 2 ? Colors.white : AppColors.fillGrey ,
      appBar: CustomAppBar(title: '교실'),
      body: Column(
        children: [
          DropdownWidget(),
          SearchBarWidget(),
          Expanded(
            child: category == 1
                ? Container(
                  width: screenWidth * 0.91,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 26, bottom: 13),
                        child: AddClassWidget(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 13),
                          child: postList(),
                        ),
                      ),
                    ],
                  ),
                )
                : category == 2
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 25),
                      child: Text('총 파일 3개', style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 14, color: AppColors.grey),),
                    ),
                    Expanded(child: documentList()),
                  ],
            )
                : category == 3
                ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18, bottom: 18, top: 15),
                      child: Row(
                        children: [
                          Text('학생 ', style: TextStyle(fontFamily: 'NotoSansKRBold', fontSize: 14, color: AppColors.grey),),
                          Text('총3명', style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 14, color: AppColors.grey),)
                        ],
                      ),
                    ),
                    Expanded(child: studentList()),
                  ],
                )
                : Center(child: Text('No category selected')), // 기본값
          ),
        ],
      ),
    );
  }

  Widget studentList() {
    return Container(
      width: MediaQuery.of(context).size.width*0.91,
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final studentList = students[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: StudentListWidget(
                  name: studentList.name,
                  studentNumber: studentList.studentNumber,
                  phoneNumber: studentList.phoneNumber,
                  email: studentList.email,
              ),
            );
          },
        itemCount: posts.length,
      ),
    );
  }

  Widget documentList() {
    return Container(
      width: MediaQuery.of(context).size.width*0.91,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final documentList = documents[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 31),
            child: DocumentListWidget(
                name: documentList.name,
                details: documentList.details,
                type: documentList.type,
            ),
          );
        },
        itemCount: posts.length,
      ),
    );
  }

  Widget postList() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: screenWidth*0.91,
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final postList = posts[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: ClassroomPostWidget(
                  name: postList.name,
                  date: postList.date,
                  content: postList.content,
                  like: postList.like,
                  comment: postList.comment,
              ),
            );
          },
          itemCount: posts.length,
        ),
      ),
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
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 17, right: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Text('게시판', style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 15, color: category == 1 ? AppColors.blue : AppColors.grey ),),
                  onTap: () {
                    setState(() {
                      category = 1;
                      print('게시판');
                    });
                  },
                ),
                SizedBox(width: 21),
                GestureDetector(
                  child: Text('자료', style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 15, color: category == 2 ? AppColors.blue : AppColors.grey ),),
                  onTap: () {
                    setState(() {
                      category = 2;
                      print('자료');
                    });
                  },
                ),
                SizedBox(width: 21),
                GestureDetector(
                  child: Text('학생', style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 15, color: category == 3 ? AppColors.blue : AppColors.grey ),),
                  onTap: () {
                    setState(() {
                      category = 3;
                      print('학생');
                    });
                  },
                )
              ],
            ),
            SvgPicture.asset(height: 18, width: 18, 'assets/images/icons/search_icon.svg'),
          ],
        ),
      ),
    );
  }

  Widget AddClassWidget() {
    return GestureDetector(
      onTap: () {
        _showModal(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.91,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xff898989).withOpacity(0.1),
              blurRadius: 9.2,
              spreadRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 11, bottom: 11),
          child: Row(
            children: [
              Container(
                width: 21, height: 21,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset('assets/images/icons/add_icon.svg'),
                ),
              ),
              SizedBox(width: 10),
              Text('게시글 추가하기', style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 15, color: AppColors.black),),
            ],
          ),
        ),
      ),
    );
  }

  void _showModal(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double customPadding = screenHeight*0.22;

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SizedBox(
            height: screenHeight*0.88,
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 24.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child:  Image.asset('assets/images/icons/cancel_icon.png'),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('게시글 내용', style: TextStyle(color: AppColors.black, fontFamily: 'NotoSansKRMedium', fontSize: 15),),
                        SizedBox(height: 9),
                        TextField(
                          maxLines: 15,
                          decoration: InputDecoration(
                            hintText: '게시글을 작성해주세요.',
                            hintStyle: TextStyle(color: Color(0xffD4D8E0), fontSize: 15, fontFamily: 'NotoSansKRRegular'),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffD4D8E0), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffD4D8E0), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffD4D8E0), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: customPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 48,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      surfaceTintColor: Colors.white,
                                      shadowColor: Colors.transparent,
                                      side: BorderSide(color: AppColors.blue, width: 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      '취소',
                                      style: TextStyle(
                                          fontFamily: 'NotoSansKRSemiBold',
                                          fontSize: 14,
                                          color: AppColors.blue),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  height: 48,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.blue,
                                      side: BorderSide(color: AppColors.blue, width: 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      showAlertDialog(context);
                                    },
                                    child: Text(
                                      '작성 완료',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'NotoSansKRSemiBold',
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}