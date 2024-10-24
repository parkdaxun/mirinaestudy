import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mirinaestudy/widget/classroom/classroom_comment_widget.dart';

import '../../colors.dart';

class ClassroomPostWidget extends StatefulWidget {
  final String name;
  final String date;
  final String content;
  final int like;
  final int comment;

  const ClassroomPostWidget({
    Key? key,
    required this.name,
    required this.date,
    required this.content,
    required this.like,
    required this.comment,
  }): super(key: key);

  @override
  _ClassroomPostWidgetState createState() => _ClassroomPostWidgetState();
}

class CommentList {
  String name;
  String studentNumber;
  int like;
  String comment;
  String date;

  CommentList({
    required this.name,
    required this.studentNumber,
    required this.like,
    required this.comment,
    required this.date,
  });
}

class _ClassroomPostWidgetState extends State<ClassroomPostWidget> {
  final List<CommentList> comments = [
    CommentList(
      name: 'Park Daeun',
      studentNumber: '000-1234-1234',
      date: '2024.08.22 오후 06:30',
      like: 3,
      comment: 'Where there is a will there is a way',
    ),
    CommentList(
      name: 'Park Daeun',
      studentNumber: '000-1234-1234',
      date: '2024.08.22 오후 06:30',
      like: 3,
      comment: 'Where there is a will there is a way',
    ),
    CommentList(
      name: 'Park Daeun',
      studentNumber: '000-1234-1234',
      date: '2024.08.22 오후 06:30',
      like: 3,
      comment: 'Where there is a will there is a way',
    ),
  ];

  bool commentClicked = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 17, right: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name, style: TextStyle(fontFamily: 'NunitoSansSemiBold', fontSize: 16, color: AppColors.black),),
                    SizedBox(height: 4,),
                    Text(widget.date, style: TextStyle(fontFamily: 'NunitoSansRegular', fontSize: 13, color: AppColors.grey),),
                  ],
                ),
                SvgPicture.asset('assets/images/icons/dot_setting_icon.svg'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 24, right: 17, bottom: 24),
            child: Text(
              widget.content,
              style: TextStyle(fontFamily: 'NunitoSansRegular', fontSize: 15, color: AppColors.black),),
          ),
          Container(height: 1, color: Color(0xffE5E5EA),),
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 17, bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/icons/heart_icon.svg'),
                SizedBox(width: 3),
                Text('좋아요 ${widget.like}', style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 13, color: AppColors.grey),),
                SizedBox(width: 9),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      commentClicked = !commentClicked;
                    });
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/icons/comment_icon.svg'),
                      SizedBox(width: 3),
                      Text('댓글 ${widget.comment}', style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 13, color: AppColors.grey),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (commentClicked)
            Column(
              children: [
                Container(height: 1, color: Color(0xffE5E5EA),),
                commentList(),
              ],
            ),
        ],
      ),
    );
  }

  Widget commentList() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: screenWidth*0.91,
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
              final commentList = comments[index];
              return ClassroomCommentWidget(
                    name: commentList.name,
                    studentNumber: commentList.studentNumber,
                    comment: commentList.comment,
                    like: commentList.like,
                    date: commentList.date,
              );
            },
          itemCount: comments.length,
        ),
      ),
    );
  }
}