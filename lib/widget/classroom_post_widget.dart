import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';

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

class _ClassroomPostWidgetState extends State<ClassroomPostWidget> {
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
                    Text('Robert Smith', style: TextStyle(fontFamily: 'NotoSansKRSemiBold', fontSize: 16, color: AppColors.black),),
                    SizedBox(height: 4,),
                    Text('2024.08.30 오후 02:28', style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 13, color: AppColors.grey),),
                  ],
                ),
                SvgPicture.asset('assets/images/icons/dot_setting_icon.svg'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 24, right: 17, bottom: 24),
            child: Text('This paper investigates the cognitive processes involved in English word recognition among young EFL learners using eye-tracking methodology. A quasi-experimental mixed method design was used to investigate how young.',
              style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 15, color: AppColors.black),),
          ),
          Container(height: 1, color: Color(0xffE5E5EA),),
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 17, bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/icons/heart_icon.svg'),
                SizedBox(width: 3),
                Text('좋아요 3', style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 13, color: AppColors.grey),),
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
                      Text('댓글 4', style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 13, color: AppColors.grey),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (commentClicked)
            Container(
              child: Column(
                children: [
                  Container(height: 1, color: Color(0xffE5E5EA),),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0, left: 47, right: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Bessie Cooper', style: TextStyle(fontFamily: 'NotoSansKRSemiBold', fontSize: 16, color: AppColors.black),),
                                  SizedBox(height: 4,),
                                  Text('0000-00000-000', style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 13, color: AppColors.grey),),
                                ],
                              ),
                              SvgPicture.asset('assets/images/icons/dot_setting_icon.svg'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 47, right: 17, top: 7),
                          child: Text('Practise your listening, writing and speaking and learn useful language to use at work or to communicate.',
                            style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 14, color: AppColors.black),),
                        ),
                        //Row(
                        //  children: [
                        //    SvgPicture.asset('assets/images/icons/heart_icon.svg'),
                        //  ],
                        //)
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