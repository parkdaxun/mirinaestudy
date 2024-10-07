import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinaestudy/widget/app_bar.dart';
import 'package:mirinaestudy/widget/comment_list_wdiget.dart';

import '../../colors.dart';

class CommentDetailScreen extends StatefulWidget {
  final String title;
  final String date;
  final String contents;
  final String endDate;

  const CommentDetailScreen({
    required this.title,
    required this.date,
    required this.contents,
    required this.endDate,
  });

  @override
  _CommentDetailScreenState createState() => _CommentDetailScreenState();
}

class _CommentDetailScreenState extends State<CommentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '과제'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17, bottom: 11, top: 22),
            child: Text(widget.title, style: TextStyle(fontFamily: 'NotoSansKRSemiBold', fontSize: 16, color: AppColors.blue)),
          ),
          Container(width: screenWidth, height: 1, color: Color(0xffE5E5EA),),
          DropdownContainer(),
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 22),
            child: Text('과제 내용', style: TextStyle(fontFamily: 'NotoSansKRMedium', color: AppColors.blue, fontSize: 15),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 12, right: 18, bottom: 31),
            child: Text(widget.contents, style: TextStyle(fontFamily: 'NotoSansKRRegular', color: AppColors.black, fontSize: 15),),
          ),
          Container(width: screenWidth, height: 1, color: Color(0xffE5E5EA),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/icons/heart_icon.png'),
                SizedBox(width: 5),
                Text('좋아요', style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 13, color: AppColors.grey)),
                SizedBox(width: 15),
                Container(
                  child: Row(
                    children: [
                      Image.asset('assets/images/icons/chat_icon.png'),
                      SizedBox(width: 5),
                      Text('댓글', style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 13, color: AppColors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(height: 12, color: Color(0xffE5E5EA),),
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 15, bottom: 10.5),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '댓글',
                    style: TextStyle(fontFamily: 'NotoSansKRMedium', color: AppColors.black, fontSize: 15),
                  ),
                  const TextSpan(
                    text: ' 총4개',
                    style: TextStyle(fontFamily: 'NotoSansKRMedium', color: AppColors.grey, fontSize: 15),
                  )
                ]
              ),
            ),
          ),
          Container(width: screenWidth, height: 1, color: Color(0xffE5E5EA),),
          CommentListWidget(name: 'Park Daeun', phoneNumber: '000-0000-0000', like: '4', date: '2024.10.07'),
        ],
      ),
    );
  }

  Widget DropdownContainer() {
    return Container(
      height: 74,
      decoration: BoxDecoration(color: Color(0xffF2FBFF)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Row(
              children: [
                Image.asset('assets/images/icons/book_icon.png'),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '과제-2',
                  style: TextStyle(
                      fontFamily: 'NotoSansKRRegular',
                      color: AppColors.black,
                      fontSize: 15),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0, right: 17, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.endDate,
                  style: TextStyle(
                      fontFamily: 'NotoSansKRRegular',
                      color: AppColors.grey,
                      fontSize: 13),
                ),
                Image.asset('assets/images/icons/dropdown_icon.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
