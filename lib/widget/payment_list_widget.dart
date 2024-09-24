import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class PaymentListWidget extends StatefulWidget {
  final String date;
  final String title;
  final String cost;
  final String name;
  final String deposit;
  final String withdraw;
  final String recipient;

  const PaymentListWidget({
    Key? key,
    required this.date,
    required this.title,
    required this.cost,
    required this.name,
    required this.deposit,
    required this.withdraw,
    required this.recipient,
  }) : super(key: key);

  @override
  _PaymentListWidgetState createState() => _PaymentListWidgetState();
}

class _PaymentListWidgetState extends State<PaymentListWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: screenWidth * 0.91,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff898989).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 9.2,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 17, right: 17, top: 16, bottom: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.date,
                  style: TextStyle(
                    fontFamily: 'NotoSansKRSemiBold',
                    color: AppColors.black,
                    fontSize: 15,
                  ),
                ),
                Text(
                  '결제 ' + widget.cost + '원',
                  style: TextStyle(
                    fontFamily: 'NotoSansKRMedium',
                    color: AppColors.blue,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontFamily: 'NotoSansKRSemiBold',
                        color: AppColors.black,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '상세보기',
                          style: TextStyle(
                            fontFamily: 'NotoSansKRRegular',
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 7),
                        Image.asset('assets/images/icons/dropdown_icon.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (isExpanded)
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '보낸 분 통장표시',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NotoSansKRRegular',
                                color: AppColors.black),
                          ),
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NotoSansKRRegular',
                                color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.77),
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xffE5E5EA),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '입금처',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NotoSansKRRegular',
                                color: AppColors.black),
                          ),
                          Text(
                            widget.deposit,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NotoSansKRRegular',
                                color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 11.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '출금처',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NotoSansKRRegular',
                                color: AppColors.black),
                          ),
                          Text(
                            widget.withdraw,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NotoSansKRRegular',
                                color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 11.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '받는 분 통장표시',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NotoSansKRRegular',
                                color: AppColors.black),
                          ),
                          Text(
                            widget.recipient,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NotoSansKRRegular',
                                color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
