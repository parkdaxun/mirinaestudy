import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirinaestudy/widget/app_bar.dart';
import 'package:mirinaestudy/widget/report_list_widget.dart';

import '../colors.dart';
import '../widget/showFilterModalWidget.dart';

class ReportScreen extends StatefulWidget {
  _ReportScreenState createState() => _ReportScreenState();
}

class Report {
  String title;
  String teacher;
  String score;
  String date;

  Report({
    required this.title,
    required this.teacher,
    required this.score,
    required this.date,
  });
}

class _ReportScreenState extends State<ReportScreen> {
  final List<Report> reports = [
    Report(
        title: 'Conversational English',
        teacher: 'Guy Hawkins',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        title: 'Grammar Lesson',
        teacher: 'Cody Fisher',
        score: '75/100',
        date: '2024-09-23'),
    Report(
        title: 'Phrasal Verbs',
        teacher: 'Jacob Jones',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        title: 'Conversational English',
        teacher: 'Albert Flores',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        title: 'Grammar Lesson',
        teacher: 'Cameron Williamson',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        title: 'Conversational English',
        teacher: 'Cameron Williamson',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        title: 'Conversational English',
        teacher: 'Kathryn Murphy',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        title: 'Conversational English',
        teacher: 'Kathryn Murphy',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        title: 'Conversational English',
        teacher: 'Kathryn Murphy',
        score: '80/100',
        date: '2024-09-23'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '성적표'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          filteringWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: reportList(),
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
          barrierColor: Colors.transparent,
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
                        statusFilter: false,
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
                  Image.asset('assets/images/icons/dropdown_icon.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget reportList() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: screenWidth * 0.91,
        child: ReorderableListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return Padding(
              key: ValueKey(report),
              padding: const EdgeInsets.only(bottom: 11),
              child: ReportListWidget(
                title: report.title,
                teacher: report.teacher,
                score: report.score,
                date: report.date,
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
      final Report movedHomework = reports.removeAt(oldIndex);
      reports.insert(newIndex, movedHomework);
    });
  }
}
