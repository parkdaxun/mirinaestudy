import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirinaestudy/widget/app_bar.dart';
import 'package:mirinaestudy/widget/payment_list_widget.dart';

import '../colors.dart';
import '../widget/showFilterModalWidget.dart';

class PaymentScreen extends StatefulWidget {
  _PaymentScreenState createState() => _PaymentScreenState();
}

class Payment {
  String date;
  String title;
  String cost;
  String name;
  String deposit;
  String withdraw;
  String recipient;

  Payment({
    required this.date,
    required this.title,
    required this.cost,
    required this.name,
    required this.deposit,
    required this.withdraw,
    required this.recipient,
  });
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<Payment> payments = [
    Payment(
      date: '2024-07-17',
      title: 'Cemester 3',
      cost: '250,000',
      name: '김이름',
      deposit: '신한은행 110000000001',
      withdraw: '국민은행 02000000000002',
      recipient: 'Mirinae Study',
    ),
    Payment(
      date: '2024-07-17',
      title: 'Cemester 3',
      cost: '250,000',
      name: '김이름',
      deposit: '신한은행 110000000001',
      withdraw: '국민은행 02000000000002',
      recipient: 'Mirinae Study',
    ),
    Payment(
      date: '2024-07-17',
      title: 'Cemester 3',
      cost: '250,000',
      name: '김이름',
      deposit: '신한은행 110000000001',
      withdraw: '국민은행 02000000000002',
      recipient: 'Mirinae Study',
    ),
    Payment(
      date: '2024-07-17',
      title: 'Cemester 3',
      cost: '250,000',
      name: '김이름',
      deposit: '신한은행 110000000001',
      withdraw: '국민은행 02000000000002',
      recipient: 'Mirinae Study',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillGrey,
      appBar: CustomAppBar(title: '결제 이력'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          filteringWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: paymentList(),
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

  Widget paymentList() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: screenWidth * 0.91,
        child: ReorderableListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: payments.length,
          itemBuilder: (context, index) {
            final payment = payments[index];
            return Padding(
              key: ValueKey(payment),
              padding: const EdgeInsets.only(bottom: 11),
              child: PaymentListWidget(
                date: payment.date,
                title: payment.title,
                cost: payment.cost,
                name: payment.name,
                deposit: payment.deposit,
                withdraw: payment.withdraw,
                recipient: payment.recipient,
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
      final Payment movedHomework = payments.removeAt(oldIndex);
      payments.insert(newIndex, movedHomework);
    });
  }
}
