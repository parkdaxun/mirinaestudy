import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mirinaestudy/widget/app_bar.dart';

import '../colors.dart';
import '../widget/classroom/classroom_post_widget.dart';

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

class _ClassroomScreenState extends State<ClassroomScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '교실'),
      body: Column(
          children: [
            SearchBarWidget(),
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
    );
  }

  Widget postList() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: screenWidth*0.91,
        child: ListView.builder(
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
                Text('게시판', style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 15, color: AppColors.blue),),
                SizedBox(width: 21),
                Text('자료', style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 15, color: AppColors.grey),),
                SizedBox(width: 21),
                Text('학생', style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 15, color: AppColors.grey),),
              ],
            ),
            SvgPicture.asset(height: 18, width: 18, 'assets/images/icons/search_icon.svg'),
          ],
        ),
      ),
    );
  }

  Widget AddClassWidget() {
    return Container(
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
    );
  }
}