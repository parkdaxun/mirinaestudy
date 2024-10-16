import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mirinaestudy/widget/homework_list_widget.dart';
import 'package:mirinaestudy/widget/showFilterModalWidget.dart';
import '../../colors.dart';
import '../../widget/app_bar.dart';

class HomeworkScreen extends StatefulWidget {
  @override
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class Homework {
  String title;
  String status;
  String date;
  String contents;
  String endDate;

  Homework({
    required this.title,
    required this.status,
    required this.date,
    required this.contents,
    required this.endDate,
  });
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  final List<Homework> homeworks = [
    Homework(
        title: 'Grammar',
        status: '완료',
        date: '2024-09-09',
        contents:
            '중독의 원인, 몇가지 우리가 알고 있는 중독에 대해서 토론해보고 그것이 무엇인지 설명하여, 사람들이 무언가에 중독 되는 이유를 제공하고 문제를 다루는 방법에 대한 아이디어를 제시하시오.',
        endDate: '2024.09.30 (12:00PM)'),
    Homework(
        title: 'Grammar',
        status: '진행중',
        date: '2024-09-09',
        contents:
            '중독의 원인, 몇가지 우리가 알고 있는 중독에 대해서 토론해보고 그것이 무엇인지 설명하여, 사람들이 무언가에 중독 되는 이유를 제공하고 문제를 다루는 방법에 대한 아이디어를 제시하시오.',
        endDate: '2024.09.30 (12:00PM)'),
    Homework(
        title: 'Phrasal Verbs',
        status: '시작전',
        date: '2024-09-09',
        contents:
            '중독의 원인, 몇가지 우리가 알고 있는 중독에 대해서 토론해보고 그것이 무엇인지 설명하여, 사람들이 무언가에 중독 되는 이유를 제공하고 문제를 다루는 방법에 대한 아이디어를 제시하시오.',
        endDate: '2024.09.30 (12:00PM)'),
    Homework(
        title: 'Conversational English',
        status: '진행중',
        date: '2024-09-09',
        contents:
            '중독의 원인, 몇가지 우리가 알고 있는 중독에 대해서 토론해보고 그것이 무엇인지 설명하여, 사람들이 무언가에 중독 되는 이유를 제공하고 문제를 다루는 방법에 대한 아이디어를 제시하시오.',
        endDate: '2024.09.30 (12:00PM)'),
    Homework(
        title: 'Grammar',
        status: '완료',
        date: '2024-09-09',
        contents:
            '중독의 원인, 몇가지 우리가 알고 있는 중독에 대해서 토론해보고 그것이 무엇인지 설명하여, 사람들이 무언가에 중독 되는 이유를 제공하고 문제를 다루는 방법에 대한 아이디어를 제시하시오.',
        endDate: '2024.09.30 (12:00PM)'),
    Homework(
        title: 'Conversational English',
        status: '시작전',
        date: '2024-09-09',
        contents:
            '중독의 원인, 몇가지 우리가 알고 있는 중독에 대해서 토론해보고 그것이 무엇인지 설명하여, 사람들이 무언가에 중독 되는 이유를 제공하고 문제를 다루는 방법에 대한 아이디어를 제시하시오.',
        endDate: '2024.09.13 (12:00PM)'),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double titleLeftPadding = (screenWidth - screenWidth * 0.91) / 2;

    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '과제'),
      body: Column(
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
    );
  }

  Widget filteringWidget() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierColor: Colors.transparent, // 배경을 투명하게 설정
          builder: (BuildContext context) {
            return Stack(
              children: [
                // 배경을 SafeArea로 감싸서 노치 포함한 영역까지 확장
                Positioned.fill(
                  bottom: 0,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.transparent, // 위쪽은 완전히 투명
                        ),
                      ),
                      // 아래쪽 반투명 배경
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: screenHeight -
                              (screenHeight * 0.05 + screenHeight * 0.26),
                          color:
                              Color(0xff232323).withOpacity(0.4), // 반투명 배경 설정
                        ),
                      ),
                    ],
                  ),
                ),
                // 필터 모달 창
                Positioned(
                  top: kToolbarHeight + screenHeight * 0.05,
                  left: 0,
                  right: 0,
                  child: Material(
                    child: Container(
                      child: showFilterModalWidget(
                        statusFilter: true,
                      ), // 모달 위젯 추가
                    ),
                  ),
                ),
              ],
            );
          },
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
                  SvgPicture.asset('assets/images/icons/dropdown_icon.svg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeworkList() {
    double screenWidth = MediaQuery.of(context).size.width;

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
                contents: homework.contents,
                endDate: homework.endDate,
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
