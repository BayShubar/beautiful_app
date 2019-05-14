import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

import './data.dart';
import './widgets/page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnboardingPage();
}

class _OnboardingPage extends State<OnboardingPage> {
  PageController _controller;
  int _currentPage = 0;
  bool _lastPage = false;

  @override
  void initState() {
    _controller = PageController(initialPage: _currentPage);
    super.initState();
  }

  /**
   * Called when this object is removed from the tree permanently
   * Subclasses should override this method to release any 
   * resources retained by this object (e.g., stop any active animations).
   */
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildStackContent() => PageView.builder(
      itemCount: pageList.length,
      controller: _controller,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
          if (index == pageList.length - 1) {
            _lastPage = true;
          } else {
            _lastPage = false;
          }
        });
      },
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                PageModel page = pageList[index];
                var delta;
                var y = 1.0;

                if (_controller.position.haveDimensions) {
                  delta = _controller.page - index;
                  y = 1 - delta.abs().clamp(0.0, 1.0);
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(page.imageUrl),
                    // Title of onboarding
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      height: 100,
                      child: Stack(
                        children: <Widget>[
                          Opacity(
                            opacity: 0.1,
                            child: GradientText(
                              page.title,
                              gradient:
                                  LinearGradient(colors: page.titleGradient),
                              style: TextStyle(
                                  fontSize: 90,
                                  fontFamily: 'Montserrat-Black',
                                  letterSpacing: 1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30, left: 22),
                            child: GradientText(
                              page.title,
                              gradient:
                                  LinearGradient(colors: page.titleGradient),
                              style: TextStyle(
                                  fontSize: 70,
                                  fontFamily: 'Montserrat-Black',
                                  letterSpacing: 1),
                            ),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 12, top: 34),
                      child: Transform(
                        transform:
                            Matrix4.translationValues(0, 50 * (1 - y), 0),
                        child: Text(page.body,
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF9B9B9B),
                                fontFamily: 'Montserrat-Medium')),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        );
      });

  Widget _buildStackIndicator() => Positioned(
        left: 30,
        bottom: 55,
        child: Container(
          width: 160,
          child: PageIndicator(
            currentPage: _currentPage,
            pageCount: pageList.length,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              colors: [Color(0xFF485563), Color(0xFF29323C)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // A scrollable list that works page by page.
            _buildStackContent(),
            _buildStackIndicator(),
            Positioned(
              right: 30,
              bottom: 30,
              child: _lastPage
                  ? FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: ()=> print('continue...'),
                      child: Icon(Icons.arrow_forward, color: Colors.black,),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
