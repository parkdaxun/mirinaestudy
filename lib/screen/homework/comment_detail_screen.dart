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

class Comment {
  String name;
  String phoneNumber;
  String like;
  String date;

  Comment({
    required this.name,
    required this.phoneNumber,
    required this.like,
    required this.date,
  });
}

class _CommentDetailScreenState extends State<CommentDetailScreen> {
  final List<Comment> comments = [
    Comment(
      name: 'Park Daeun',
      phoneNumber: '000-0000-0000',
      like: '4',
      date: '2024.10.07',
    ),
    Comment(
      name: 'Park Daeun',
      phoneNumber: '000-0000-0000',
      like: '4',
      date: '2024.10.07',
    ),
    Comment(
      name: 'Park Daeun',
      phoneNumber: '000-0000-0000',
      like: '4',
      date: '2024.10.07',
    ),
    Comment(
      name: 'Park Daeun',
      phoneNumber: '000-0000-0000',
      like: '4',
      date: '2024.10.07',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '과제'),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: SizedBox(
          width: screenWidth*0.91,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              _showModal(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('댓글 작성', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'NotoSansKRSemiBold'),),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
           Container(
             width: screenWidth,
             child: Column(
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
                           ),
                         ],
                     ),
                   ),
                 ),
                 Container(width: screenWidth, height: 1, color: Color(0xffE5E5EA),),
                 commentList(),
               ],
             ),
           ),
          ],
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
                        children: [Image.asset('assets/images/icons/cancel_icon.png'),],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('댓글 내용', style: TextStyle(color: AppColors.black, fontFamily: 'NotoSansKRMedium', fontSize: 15),),
                        SizedBox(height: 9),
                        TextField(
                          maxLines: 15,
                          decoration: InputDecoration(
                            hintText: '댓글을 작성해주세요.',
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
                                    onPressed: () {},
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
                                      _showMyDialog(context);
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

  Future<void> _showMyDialog(BuildContext context) async {
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
                    ),
                  if(!isSubmitted)
                    SizedBox(
                      height: 15,
                    ),
                  Text(
                    isSubmitted ? '댓글이 추가 되었습니다.' : '댓글을 추가하시겠습니까?',
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
                            Navigator.of(context).pop();
                          },
                          child: Text('취소', style: TextStyle(color: AppColors.grey, fontSize: 15, fontFamily: 'NotoSansKRMedium'),),
                        ),
                        Container(width: 1, height: 16, decoration: BoxDecoration(color: Color(0xffDEDEDE),),),
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

  Widget commentList() {
    return Center(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        itemCount: comments.length,
        itemBuilder: (context, index) {
          final comment = comments[index];
          return Padding(
            key: ValueKey(comment),
            padding: const EdgeInsets.only(bottom: 0),
            child: CommentListWidget(
              name: comment.name,
              phoneNumber: comment.phoneNumber,
              date: comment.date,
              like: comment.like,
            ),
          );
        },
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
