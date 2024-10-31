import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../colors.dart';

Future<void> showAlertDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        bool isSubmitted = false;

        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: Container(
              height: 120,
              width: MediaQuery.of(context).size.width*0.81,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(isSubmitted)
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(color: Color(0xffE6F7FF), borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: SvgPicture.asset('assets/images/icons/submit_comment_icon.svg'),
                      ),
                    ),
                  if(!isSubmitted)
                    SizedBox(
                      height: 15,
                    ),
                  Text(
                    isSubmitted ? '게시글이 추가 되었습니다.' : '게시글을 추가하시겠습니까?',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 15,
                      fontFamily: 'NotoSansKRMedium',
                    ),
                  ),
                  if(!isSubmitted)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('취소', style: TextStyle(color: AppColors.grey, fontSize: 15, fontFamily: 'NotoSansKRMedium'),),
                        ),
                        Container(width: 1, height: 16, decoration: BoxDecoration(color: Color(0xffDEDEDE),),),
                        TextButton(
                          onPressed: () {
                            setState(() {isSubmitted = true;});
                            Future.delayed(Duration(seconds: 2), () {
                              Get.back();
                              Get.back();
                            });
                          },
                          child: Text('확인', style: TextStyle(color: Colors.blue, fontFamily: 'NotoSansKRMedium', fontSize: 15),),
                        )
                      ],
                    ),
                ],
              ),
            ),
          );
        });
      }
  );
}