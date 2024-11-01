import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mirinaestudy/widget/app_bar.dart';
import 'package:mirinaestudy/widget/home_menu.dart';
import '../colors.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '홈'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            welcomeComment(),
            Padding(
              padding: const EdgeInsets.only(top: 23, bottom: 14, left: 17),
              child: Text(
                '나의 게시판',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'NotoSansKRSemiBold',
                    color: AppColors.blue),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeMenuWidget(
                  title: '수업',
                  iconName: 'menu_class_icon',
                  screenName: 'ClassScreen',
                ),
                HomeMenuWidget(
                  title: '과제',
                  iconName: 'menu_homework_icon',
                  screenName: 'HomeworkScreen',
                ),
                HomeMenuWidget(
                  title: '출석',
                  iconName: 'attend_icon',
                  screenName: 'AttendanceCheckScreen',
                ),
                HomeMenuWidget(
                  title: '설정',
                  iconName: 'setting_icon',
                  screenName: 'TempScreen',
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeMenuWidget(
                  title: '교실',
                  iconName: 'classroom_icon',
                  screenName: 'ClassroomScreen',
                ),
                HomeMenuWidget(
                  title: '성적표',
                  iconName: 'paper_icon',
                  screenName: 'ReportScreen',
                ),
                HomeMenuWidget(
                  title: '결제',
                  iconName: 'card_icon',
                  screenName: 'PaymentScreen',
                ),
                HomeMenuWidget(
                  title: '고객문의',
                  iconName: 'ask_icon',
                  screenName: 'TempScreen',
                ),
              ],
            ),
            // WeekCalendarWidget(),
          ],
        ),
      ),
    );
  }

  Widget WeekCalendarWidget() {
    DateTime now = DateTime.now();
    bool isSunday = now.weekday == DateTime.sunday;

    DateTime lastSunday = now.subtract(Duration(days: now.weekday%7));
    List<DateTime> weekDates = List.generate(7, (index) => lastSunday.add(Duration(days: index)));

    return Container(
      width: MediaQuery.of(context).size.width*0.91,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 17, left: 30, right: 30, ),
        child: Column(
          children: [
          SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: weekDates
                  .map((date) => date.weekday == DateTime.sunday ? date : null)
                  .followedBy(weekDates.where((date) => date.weekday != DateTime.sunday))
                  .whereType<DateTime>()
                  .map((date) {
                bool isToday = date.year == now.year && date.month == now.month && date.day == now.day;
                return Container(
                  child: Column(
                    children: [
                      Text(
                        DateFormat.E('ko').format(date),
                        style: TextStyle(
                          fontFamily: 'NotoSansKRMedium',
                          fontSize: 14,
                          color: isToday ? AppColors.blue : AppColors.grey,
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: isToday ? AppColors.lightBlue : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontFamily: 'NotoSansKRMedium',
                              fontSize: 15,
                              color: isToday ? Colors.white : AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          ],
        ),
      ),
    );
  }

  Widget welcomeComment() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.18,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '김이름',
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColors.blue,
                      fontFamily: 'NotoSansKRSemiBold'),
                ),
                Text(
                  '환영합니다!',
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColors.black,
                      fontFamily: 'NotoSansKRSemiBold'),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 19),
                  child: SvgPicture.asset(
                    width: 149,
                    height: 79,
                    'assets/images/bigsize_pic.svg',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
