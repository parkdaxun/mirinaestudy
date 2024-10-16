import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class CommentListWidget extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String like;
  final String date;

  const CommentListWidget({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.like,
    required this.date,
  }): super(key: key);

  @override
  _CommentListWidgetState createState() => _CommentListWidgetState();
}

class _CommentListWidgetState extends State<CommentListWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 23, left:15, right: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name, style: TextStyle(fontFamily: 'NotoSansKRSemiBold', fontSize: 15, color: AppColors.black),),
                        SizedBox(height: 2,),
                        Text(widget.phoneNumber, style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 13, color: AppColors.grey),),
                      ],
                    ),
                    Image.asset('assets/images/icons/comment_setting_icon.png'),
                  ],
                ),
                SizedBox(height: 8,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 16, bottom: 9, right: 30),
                    child: Text('Practise your listening, writing and speaking and learn useful language to use at work or to communicate.'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/icons/heart_icon.svg'),
                            SizedBox(width: 3,),
                            Text(widget.like, style: TextStyle(fontFamily: 'NotoSansKRMedium', color: AppColors.grey, fontSize: 13),),
                          ],
                        ),
                      Text(widget.date, style: TextStyle(fontFamily: 'NotoSansKRMedium', color: AppColors.grey, fontSize: 13),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 19),
          child: Container(width: screenWidth, height: 1, color: Color(0xffE5E5EA),),
        ),
      ],
    );
  }
}