import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mirinaestudy/widget/app_bar.dart';
import 'package:mirinaestudy/widget/student_name_widget.dart';
import '../colors.dart';
import 'package:intl/date_symbol_data_local.dart';

class AttendanceCheckScreen extends StatefulWidget {
  _AttendanceCheckScreenState createState() => _AttendanceCheckScreenState();
}

class StudentList {
  String studentName;
  bool attendance;

  StudentList({
    required this.studentName,
    required this.attendance,
  });
}

class _AttendanceCheckScreenState extends State<AttendanceCheckScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ko');
  }

  final List<StudentList> students = [
    StudentList(
      studentName: '김이름',
      attendance: true,
    ),
    StudentList(
      studentName: '박이름',
      attendance: false,
    ),
    StudentList(
      studentName: '윤이름',
      attendance: false,
    ),
    StudentList(
      studentName: '정이름',
      attendance: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double widgetRightPadding = (MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width*0.91))/2;

    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '출석'),
      body: Column(
        children: [
          ClassesDropdownWidget(),
          SearchBarWidget(),
          WeekCalendarWidget(),
          Padding(
            padding: EdgeInsets.only(top: 22, right: widgetRightPadding, bottom: 14),
            child: StatusWidget(),
          ),
          Expanded(child: studentList()),
        ],
      ),
    );
  }

  Widget studentList() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: screenWidth*0.91,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final studentList = students[index];
            return Padding(
              key: ValueKey(studentList),
              padding: const EdgeInsets.only(bottom: 11),
              child: StudentNameWidget(
                studentName: studentList.studentName,
                attendance: studentList.attendance,
              ),
            );
          },
          itemCount: students.length,
        ),
      ),
    );
  }

  Widget ClassesDropdownWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xff6EBCFF),
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('교실 1', style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 17, color: AppColors.blue),),
            SizedBox(width: 5),
            SvgPicture.asset('assets/images/icons/blue_dropdown_icon.svg'),
          ],
        ),
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
            Text('수업 출석체크', style: TextStyle(fontSize: 15, fontFamily: 'NotoSansKRSemiBold', color: AppColors.blue),),
            SvgPicture.asset('assets/images/icons/search_icon.svg'),
          ],
        ),
      ),
    );
  }

  Widget StatusWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 7, height: 7,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          SizedBox(width: 8),
          Text('참석', style: TextStyle(fontFamily: 'NunitoSansRegular', fontSize: 13, color: AppColors.black),),
          SizedBox(width: 13),
          Container(
            width: 7, height: 7,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          SizedBox(width: 8),
          Text('불참석', style: TextStyle(fontFamily: 'NunitoSansRegular', fontSize: 13, color: AppColors.black),),
        ],
      )
    );
  }


  Widget WeekCalendarWidget() {
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;
    int currentWeekday = now.weekday;

    DateTime startOfWeek = now.subtract(Duration(days: currentWeekday - 1));
    List<DateTime> weekDates = List.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 17, right: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('${year}년 ${month}월', style: TextStyle(fontFamily: 'NotoSansKRSemiBold', fontSize: 17, color: AppColors.black)),
                    SizedBox(width: 8),
                    SizedBox(
                      width: 12,
                      height: 15,
                      child: SvgPicture.asset(fit: BoxFit.contain, 'assets/images/icons/dropdown_icon.svg'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 28,
                  width: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      side: BorderSide(width: 1, color: Color(0xff787880).withOpacity(0.2)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    onPressed: () {},
                    child: Text('오늘', style: TextStyle(fontFamily: 'NotoSansKRSemiBold', fontSize: 12, color: AppColors.grey)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: weekDates.map((date) {
                bool isToday = date.year == now.year && date.month == now.month && date.day == now.day;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Text(
                        DateFormat.E('ko').format(date), // 요일 (e.g., Mon, Tue)
                        style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 13, color: isToday ? AppColors.blue : AppColors.grey),
                      ),
                      SizedBox(height: 6),
                      Container(
                        width: 41, height: 40,
                        decoration: BoxDecoration(
                          color: isToday ? AppColors.lightBlue : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: isToday ? Colors.transparent : Color(0xff787880).withOpacity(0.2)),
                        ),
                        child: Center(
                          child: Text(
                            date.day.toString(), // 날짜 (e.g., 23)
                            style: TextStyle(fontFamily: 'NotoSansKRMedium', fontSize: 13, fontWeight: FontWeight.bold, color: isToday ? Colors.white : AppColors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}