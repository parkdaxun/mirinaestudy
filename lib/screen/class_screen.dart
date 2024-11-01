import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mirinaestudy/widget/classroom_list_widget.dart';
import '../colors.dart';
import '../widget/app_bar.dart';

class ClassScreen extends StatefulWidget {
  _ClassScreenState createState() => _ClassScreenState();
}

class ClassList {
  String name;
  String teacherName;
  int total;

  ClassList({
    required this.name,
    required this.teacherName,
    required this.total,
  });
}


class _ClassScreenState extends State<ClassScreen> {
  final List<ClassList> classes = [
    ClassList(
      name: '교실 1',
      teacherName: 'Jessica Aundney',
      total : 10,
    ),
    ClassList(
      name: '교실 2',
      teacherName: 'Jessica Aundney',
      total : 10,
    ),
    ClassList(
      name: '교실 3',
      teacherName: 'Jessica Aundney',
      total : 10,
    ),
    ClassList(
      name: '교실 4',
      teacherName: 'Jessica Aundney',
      total : 10,
    ),
    ClassList(
      name: '교실 5',
      teacherName: 'Jessica Aundney',
      total : 10,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '수업'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 13),
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
                child: ClassroomListWidget(
                  teacherName: classesList.teacherName,
                  name: classesList.name,
                  total: classesList.total,
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