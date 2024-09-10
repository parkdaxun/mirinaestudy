import 'package:flutter/material.dart';
import 'package:mirinaestudy/widget/homework_list_widget.dart';
import 'package:mirinaestudy/widget/showFilterModalWidget.dart';
import '../colors.dart';
import '../widget/app_bar.dart';

class HomeworkScreen extends StatefulWidget {
  @override
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class Homework {
  String title;
  String status;
  String date;

  Homework({required this.title, required this.status, required this.date});
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  final List<Homework> homeworks = [
    Homework(title: 'Grammar', status: '완료', date: '2024-09-09'),
    Homework(title: 'Grammar', status: '진행중', date: '2024-09-09'),
    Homework(title: 'Phrasal Verbs', status: '시작전', date: '2024-09-09'),
    Homework(
        title: 'Conversational English', status: '진행중', date: '2024-09-09'),
    Homework(title: 'Grammar', status: '완료', date: '2024-09-09'),
    Homework(
        title: 'Conversational English', status: '시작전', date: '2024-09-09'),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double titleLeftPadding = (screenWidth - screenWidth * 0.91) / 2;

    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '과제'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            filteringWidget(),
            Padding(
              padding: EdgeInsets.only(top: 23.5, left: titleLeftPadding),
              child: Text(
                '과제 진행 상태',
                style: TextStyle(
                  color: AppColors.blue,
                  fontFamily: 'NotoSansKRMedium',
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19),
              child: informStatus(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 18),
                child: homeworkList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget filteringWidget() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            barrierColor: Color(0xff232323).withOpacity(0.4),
            builder: (BuildContext context) {
              return Stack(
                children: [
                  Positioned(
                    top: kToolbarHeight + screenHeight * 0.05,
                    child: Material(
                      child: Container(
                        // z
                        child: showFilterModalWidget(),
                      )
                    ),
                  ),
                ],
              );
            }
        );
      },
      child: Container(
      width: screenWidth,
      height: screenHeight * 0.05,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 19, right: 27),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '전체',
              style: TextStyle(color: AppColors.blue, fontSize: 14),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    '2024.07.29~2024.08.29',
                    style: TextStyle(color: AppColors.grey, fontSize: 14),
                  ),
                ),
                Image.asset('assets/images/icons/dropdown_icon.png'),
              ],
            ),
          ],
        ),
      ),
    ),);
  }

  Widget homeworkList() {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Center(
      child: SizedBox(
        width: screenWidth * 0.91,
        child: ReorderableListView.builder(
          physics: BouncingScrollPhysics(), // 스크롤의 부드러운 움직임을 위해 추가
          itemCount: homeworks.length,
          itemBuilder: (context, index) {
            final homework = homeworks[index];
            return Padding(
              key: ValueKey(homework),
              padding: const EdgeInsets.only(bottom: 11),
              child: HomeworkListWidget(
                title: homework.title,
                status: homework.status,
                date: homework.date,
              ),
            );
          },
          onReorder: _onReorder,
        ),
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Homework movedHomework = homeworks.removeAt(oldIndex);
      homeworks.insert(newIndex, movedHomework);
    });
  }

  Widget informStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9, right: 19),
          child: Text(
            '완료',
            style: TextStyle(
              color: AppColors.black,
              fontFamily: 'NotoSansKRRegular',
            ),
          ),
        ),
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9, right: 19),
          child: Text(
            '진행중',
            style: TextStyle(
              color: AppColors.black,
              fontFamily: 'NotoSansKRRegular',
            ),
          ),
        ),
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9),
          child: Text(
            '시작전',
            style: TextStyle(
              color: AppColors.black,
              fontFamily: 'NotoSansKRRegular',
            ),
          ),
        ),
      ],
    );
  }
}
