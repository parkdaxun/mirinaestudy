import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../colors.dart';

class ClassroomCommentWidget extends StatefulWidget {
  final String name;
  final String studentNumber;
  final String comment;
  final int like;
  final String date;

  const ClassroomCommentWidget({
    Key? key,
    required this.name,
    required this.studentNumber,
    required this.comment,
    required this.like,
    required this.date,
  }): super(key: key);

  @override
  _ClassroomCommentWidgetState createState() => _ClassroomCommentWidgetState();
}

class _ClassroomCommentWidgetState extends State<ClassroomCommentWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth*0.91,
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                          Text(widget.name, style: TextStyle(fontFamily: 'NotoSansKRSemiBold', fontSize: 16, color: AppColors.black),),
                          SizedBox(height: 4,),
                          Text(widget.studentNumber, style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 13, color: AppColors.grey),),
                        ],
                      ),
                      SvgPicture.asset('assets/images/icons/dot_setting_icon.svg'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 47, right: 17, top: 7),
                  child: Text(
                    widget.comment,
                    style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 14, color: AppColors.black),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 47, right: 17, top: 9, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/icons/heart_icon.svg'),
                          SizedBox(width: 5),
                          Text('좋아요 ${widget.like}', style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 12, color: AppColors.grey),),
                        ],
                      ),
                      Text(widget.date, style: TextStyle(fontFamily: 'NotoSansKRRegular', fontSize: 12, color: AppColors.grey)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}