import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mirinaestudy/screen/lesson_screen.dart';
import '../colors.dart';

class SearchResultWidget extends StatefulWidget {
  final List<dynamic> tempDataList;
  SearchResultWidget({required this.tempDataList});

  @override
  _SearchResultWidgetState createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = widget.tempDataList;  // 초기 값으로 전체 리스트를 설정
    _searchController.addListener(_filterList);
  }

  void _filterList() {
    setState(() {
      filteredList = widget.tempDataList
          .where((lesson) =>
          lesson.lessonName.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterList);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSearchBar(),
          Padding(
            padding: const EdgeInsets.only(top: 17, left: 17, bottom: 33),
            child: Row(
              children: [
                Text(
                  '검색 결과',
                  style: TextStyle(
                      fontFamily: 'NotoSansKRMedium',
                      fontSize: 15,
                      color: AppColors.black
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  '총 ${filteredList.length}개',
                  style: TextStyle(
                      fontFamily: 'NotoSansKRMedium',
                      fontSize: 15,
                      color: AppColors.grey
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildResultList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 47,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xff0099FF),
            width: 2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 11, bottom: 12, left: 3, right: 3),
        child: TextField(
          controller: _searchController,
          cursorColor: AppColors.grey,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            hintText: '수업명 입력',
            hintStyle: TextStyle(
              fontFamily: 'NotoSansKRRegular',
              fontSize: 14,
              color: Color(0xffD7DBE4),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            suffixIcon: Container(
              width: 18,
              height: 18,
              child: SvgPicture.asset(
                'assets/images/icons/search_icon.svg',
                width: 18,
                height: 18,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultList() {
    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // 가로로 최대 확장
            mainAxisSize: MainAxisSize.min, // 최소한의 높이만 차지하도록 설정
            children: [
              Row(
                children: [
                  Text(
                    filteredList[index].lessonName,
                    style: TextStyle(
                      fontFamily: 'NunitoSansSemiBold',
                      fontSize: 15,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    '  (${filteredList[index].details})',
                    style: TextStyle(
                      fontFamily: 'NunitoSansRegular',
                      fontSize: 14,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity, // 너비를 최대한으로 설정
                height: 1,
                color: Color(0xffE5E5EA),
              ),
            ],
          ),
        );
      },
    );
  }
}
