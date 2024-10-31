import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mirinaestudy/widget/app_bar.dart';
import 'package:mirinaestudy/widget/dropdown_widget.dart';
import 'package:mirinaestudy/widget/report_list_widget.dart';
import 'package:mirinaestudy/widget/search_result_widget.dart';

import '../colors.dart';
import '../widget/showFilterModalWidget.dart';

class ReportScreen extends StatefulWidget {
  _ReportScreenState createState() => _ReportScreenState();
}

class Report {
  String lessonName;
  String teacher;
  String score;
  String date;

  Report({
    required this.lessonName,
    required this.teacher,
    required this.score,
    required this.date,
  });
}

class _ReportScreenState extends State<ReportScreen> {

  final List<Report> reports = [
    Report(
        lessonName: 'Conversational English',
        teacher: 'Guy Hawkins',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        lessonName: 'Grammar Lesson',
        teacher: 'Cody Fisher',
        score: '75/100',
        date: '2024-09-23'),
    Report(
        lessonName: 'Phrasal Verbs',
        teacher: 'Jacob Jones',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        lessonName: 'Conversational English',
        teacher: 'Albert Flores',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        lessonName: 'Grammar Lesson',
        teacher: 'Cameron Williamson',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        lessonName: 'Conversational English',
        teacher: 'Cameron Williamson',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        lessonName: 'Conversational English',
        teacher: 'Kathryn Murphy',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        lessonName: 'Conversational English',
        teacher: 'Kathryn Murphy',
        score: '80/100',
        date: '2024-09-23'),
    Report(
        lessonName: 'Conversational English',
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
          DropdownWidget(),
          SearchBarWidget(),
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

  Widget SearchBarWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border : Border(
          bottom: BorderSide(
            color: Color(0xffE5E5EA),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, top: 11, bottom: 14, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('학생', style: TextStyle(fontSize: 15, fontFamily: 'NotoSansKRSemiBold', color: AppColors.blue),),
                SizedBox(width: 3,),
                Text('총 10명', style: TextStyle(fontSize: 15, fontFamily: 'NotoSansKRRegular', color: AppColors.grey),),
              ],
            ),
            GestureDetector(
              onTap: () {
              },
              child: SvgPicture.asset('assets/images/icons/search_icon.svg'),
            ),
          ],
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
                lessonName: report.lessonName,
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
