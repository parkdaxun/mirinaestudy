import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../colors.dart';
import '../widget/app_bar.dart';
import '../widget/class_list_widget.dart';

class ClassScreen extends StatefulWidget {
  _ClassScreenState createState() => _ClassScreenState();
}

class ClassList {
  String className;
  String teacherName;
  String time;

  ClassList({
    required this.className,
    required this.teacherName,
    required this.time,
  });
}

class _ClassScreenState extends State<ClassScreen> {
  final List<ClassList> classes = [
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
    ClassList(
      className: 'Grammar Lesson',
      teacherName: 'Robert Smith',
      time: '10:30 AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '수업'),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: classList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget classList() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: screenWidth * 0.91,
        child: ReorderableListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final classesList = classes[index];
              return Padding(
                key: ValueKey(classesList),
                padding: const EdgeInsets.only(bottom: 11),
                child: ClassListWidget(
                  teacherName: classesList.teacherName,
                  className: classesList.className,
                  time: classesList.time,
                ),
              );
            },
            itemCount: classes.length,
            onReorder: _onReorder),
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final ClassList movedHomework = classes.removeAt(oldIndex);
      classes.insert(newIndex, movedHomework);
    });
  }
}
