import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return // Form container
        Container(
            width: double.infinity,
            height: ScreenUtil.getInstance().setHeight(500),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 15),
                      blurRadius: 15),
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, -10),
                      blurRadius: 10),
                ]),
            child: Padding(
              padding: EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(45),
                        letterSpacing: 0.6,
                        fontFamily: 'Poppins-bold'),
                  ),

                  // Text filed with title
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Text('Username',
                      style: TextStyle(
                          fontFamily: 'Popins-Medium',
                          fontSize: ScreenUtil.getInstance().setSp(25))),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'username',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),

                  // Text Fiede with titl
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        fontFamily: 'Popin-Medium',
                        fontSize: ScreenUtil.getInstance().setSp(26)),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),

                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(35),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Forget Password',
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Popin-Medium',
                            fontSize: ScreenUtil.getInstance().setSp(28)),
                      )
                    ],
                  )
                ],
              ),
            ));
  }
}
