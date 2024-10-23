import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../colors.dart';

class DocumentListWidget extends StatefulWidget {
  final String name;
  final String details;
  final String type;

  const DocumentListWidget({
    Key? key,
    required this.name,
    required this.details,
    required this.type,
  }) : super(key: key);

  @override
  _DocumentListWidgetState createState() => _DocumentListWidgetState();
}

class _DocumentListWidgetState extends State<DocumentListWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
                width: 33, height: 33,
                child: SvgPicture.asset(widget.type == 'pdf' ?  'assets/images/icons/pdf_icon.svg' : 'assets/images/icons/word_icon.svg')),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: TextStyle(fontFamily: 'NunitoSansRegular', fontSize: 16, color: AppColors.black),),
                SizedBox(height: 3),
                Text(widget.details, style: TextStyle(fontFamily: 'NunitoSansRegular', fontSize: 13, color: AppColors.grey),),
              ],
            ),
          ],
        ),
        SvgPicture.asset('assets/images/icons/dot_setting_icon.svg'),
      ],
    );
  }
}