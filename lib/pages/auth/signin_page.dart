import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './widgets/FormCard.dart';
import './widgets/SocialIcons.dart';
import './widgets/CustomIcons.dart';

class SigninPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SigninPage();
}

class _SigninPage extends State {
  bool _isSelected = false;

  void _toggleRadioButton() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  // Stack element #1
  Widget _buildStackImage() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Image.asset('assets/auth/image_01.png'),
          ),
          Expanded(
            child: Container(),
          ),
          Image.asset('assets/auth/image_02.png'),
        ],
      );

  Widget _buildStackContent() => // Stack element #2
      SingleChildScrollView(
        // Main Content Padding
        child: Padding(
          padding: EdgeInsets.only(left: 28, right: 28, top: 60),
          // Main Content Column
          child: Column(
            children: <Widget>[
              _buildLogo(),

              // Distance between logo and form
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(180),
              ),

              // Form Card
              FormCard(),

              // Form Button with RadioButton
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(40),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: _toggleRadioButton,
                        child: _buildRadioButton(_isSelected),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Remmember me',
                          style: TextStyle(
                              fontFamily: 'Popin-Medium', fontSize: 12))
                    ],
                  ),

                  // Sign in button
                  _buildSigninButton(),
                ],
              ), // end of the bottom control

              // Social Network
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildHorizontalLine(),
                  Text(
                    'Social Login',
                    style: TextStyle(
                      fontFamily: 'Popoins-Medium',
                      fontSize: 16,
                    ),
                  ),
                  _buildHorizontalLine(),
                ],
              ),

              SizedBox(
                height: ScreenUtil.getInstance().setHeight(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    colors: [
                      Color(0xFF102397),
                      Color(0xFF187adf),
                      Color(0xFF00eaf8),
                    ],
                    onPressed: () {},
                    iconData: CustomIcons.facebook,
                  ),
                  SocialIcon(
                    colors: [
                      Color(0xFFff4f38),
                      Color(0xFFff355d),
                    ],
                    onPressed: () {},
                    iconData: CustomIcons.googlePlus,
                  ),
                  SocialIcon(
                    colors: [
                      Color(0xFF00c6fb),
                      Color(0xFF005bea),
                    ],
                    onPressed: () {},
                    iconData: CustomIcons.linkedin,
                  ),
                ],
              ),

              SizedBox(
                height: ScreenUtil.getInstance().setHeight(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New user? ',
                    style: TextStyle(
                      fontFamily: 'Popins-Medium',
                    ),
                  ),
                  InkWell(
                    onTap: () => print('Signup action'),
                    child: Text(' Signup',
                        style: TextStyle(
                            fontFamily: 'Popins-Medium',
                            color: Colors.blueAccent)),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  /**
   * Beutifull sign in button
   */
  Widget _buildSigninButton() => InkWell(
        onTap: () {},
        child: Container(
          width: ScreenUtil.getInstance().setWidth(330),
          height: ScreenUtil.getInstance().setHeight(100),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF6078ea).withOpacity(.3),
                    offset: Offset(0.0, 8.0),
                    blurRadius: 8.0)
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: Center(
                child: Text('SIGNIN',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontFamily: 'Popins-Bold',
                        fontSize: 20)),
              ),
            ),
          ),
        ),
      );

  /**
   * Logo image with name holder
   */
  Widget _buildLogo() => Row(
        children: <Widget>[
          Image.asset(
            'assets/auth/logo.png',
            width: ScreenUtil.getInstance().setWidth(110),
            height: ScreenUtil.getInstance().setHeight(110),
          ),
          Text(
            'EGISTIC',
            style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(46),
                fontFamily: 'Poppins-Bold',
                letterSpacing: 0.7,
                fontWeight: FontWeight.bold),
          )
        ],
      );

  /**
   * This is simple radio button implementation
   */
  Widget _buildRadioButton(bool isSelected) => Container(
      width: 16,
      height: 16,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.black)),
      child: isSelected
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            )
          : Container());

  // for 2 horizontal line in two sides of title
  Widget _buildHorizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(110),
          height: 1.5,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    /**
     * It will location and so on globally
     */
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Colors.white,
      // body can be resized to avoid overlapping the keyboard
      resizeToAvoidBottomInset: true,
      // Stack
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildStackImage(),
          _buildStackContent(),
          // Stack element #1
        ],
      ),
    );
  }
}
