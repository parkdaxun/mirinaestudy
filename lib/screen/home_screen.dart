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

class LessonList {
  String teacherName;
  String lessonName;
  String time;

  LessonList({
    required this.teacherName,
    required this.lessonName,
    required this.time,
  });
}

class TodoList {
  String todo;
  bool checked;

  TodoList({
    required this.todo,
    required this.checked,
  });
}

class _HomeScreenState extends State<HomeScreen> {
  final List<LessonList> lessons = [
    LessonList(
        teacherName: 'Albert Flores',
        lessonName: 'Grammar Lesson',
        time: '10:30 AM',
    ),
    LessonList(
      teacherName: 'Ronald Richards',
      lessonName: 'Phrasal Verbs',
      time: '05:30 PM',
    ),
    LessonList(
      teacherName: 'Ronald Richards',
      lessonName: 'Phrasal Verbs',
      time: '05:30 PM',
    ),
  ];

  final List<TodoList> todos = [
    TodoList(
      todo: 'Create task',
      checked: true,
    ),
    TodoList(
      todo: 'Grammar Homework',
      checked: false,
    ),
    TodoList(
      todo: 'Study Voca',
      checked: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '홈'),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
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
            Padding(
              padding: const EdgeInsets.only(top: 23, bottom: 14, left: 17),
              child: Text(
                '주간 일정',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'NotoSansKRSemiBold',
                    color: AppColors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, bottom: 11),
              child: WeekCalendarWidget(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, bottom: 50),
              child: TodoWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget TodoWidget() {
    return Container(
      width: MediaQuery.of(context).size.width*0.91,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF898989).withOpacity(0.1), // 그림자의 색상과 투명도
            blurRadius: 9.2, // 그림자의 흐림 반경
            spreadRadius: 1, // 그림자의 확산 반경
            offset: Offset(1, 1), // 그림자의 위치 (x, y)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 25, right: 13, bottom: 33),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/icons/todo_icon.svg'),
                    SizedBox(width: 10),
                    Text('나의 할일', style: TextStyle(fontFamily: 'NotoSansKRSemiBold', fontSize: 15, color: AppColors.black),),
                  ],
                ),
                SvgPicture.asset('assets/images/icons/dot_setting_icon.svg'),
              ],
            ),
            SizedBox(height: 20),
            todos != null && todos.isNotEmpty
            ? ListView.builder(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todoList = todos[index];
                  return Column(
                    children: [
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(todoList.todo,
                            style: TextStyle(
                              decoration : todoList.checked ? TextDecoration.lineThrough : TextDecoration.none,
                              decorationThickness: 0.5,
                              fontFamily: 'NunitoSansRegular',
                              fontSize: 15,
                              color: todoList.checked ? AppColors.grey : AppColors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: todoList.checked ? SvgPicture.asset('assets/images/icons/checked_icon.svg') : SvgPicture.asset('assets/images/icons/unchecked_icon.svg'),
                          ),
                        ],
                      ),
                      SizedBox(height: 11),
                      index+1 < todos.length ? Container(height: 1, color: Color(0xffE5E5EA)) : Container(),
                    ],
                  );
                },
            ) : Center(child: Text(""),),
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF898989).withOpacity(0.1), // 그림자의 색상과 투명도
            blurRadius: 9.2, // 그림자의 흐림 반경
            spreadRadius: 1, // 그림자의 확산 반경
            offset: Offset(1, 1), // 그림자의 위치 (x, y)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 17),
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
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.023),
                    child: Column(
                      children: [
                        Text(
                          DateFormat.E('ko').format(date),
                          style: TextStyle(
                            fontFamily: 'NotoSansKRMedium',
                            fontSize: 14,
                            color: isToday || isSunday ? AppColors.blue : (date.weekday == DateTime.sunday ? Color(0xffFF5C5C) : AppColors.grey),
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
                                color: isToday || isSunday ? Colors.white : (date.weekday == DateTime.sunday ? Color(0xffFF5C5C) : AppColors.black),
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
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width*0.81,
              height: 1,
              color: Color(0xffE5E5EA),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.81,
              child: lessons != null && lessons.isNotEmpty
                ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    final lessonsList = lessons[index];
                    return Padding(
                      key: ValueKey(lessonsList),
                      padding: const EdgeInsets.only(top: 21),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(lessonsList.lessonName, style: TextStyle(fontFamily: 'NunitoSansSemiBold', fontSize: 16, color: AppColors.black),),
                              Text(lessonsList.teacherName, style: TextStyle(fontFamily: 'NunitoSansRegular', fontSize: 14, color: AppColors.black),),
                            ],
                          ),
                          Text(lessonsList.time, style: TextStyle(fontFamily: 'NunitoSansSemiBold', fontSize: 14, color: AppColors.black),),
                        ],
                      )
                    );
                  },
              ) : Center(child: Text(""),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 7, right: MediaQuery.of(context).size.width*0.051),
                  child: SvgPicture.asset('assets/images/icons/grey_add_icon.svg'),
                ),
              ],
            ),
            SizedBox(height: 19,),
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
