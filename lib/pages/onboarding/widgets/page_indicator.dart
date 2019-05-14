import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  PageIndicator({@required this.currentPage, @required this.pageCount});

  Widget _buildindicator(bool isActive) => Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            height: 4,
            decoration: BoxDecoration(
                color: isActive ? Colors.white : Color(0xFF3E4750),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 2),
                ]),
          ),
        ),
      );

  List<Widget> _buildPageIndicators() {
    List<Widget> indicatorsList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorsList.add(_buildindicator(i == currentPage));
    }
    return indicatorsList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildPageIndicators(),
    );
  }
}
