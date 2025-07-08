import 'package:flutter/material.dart';
import 'package:prod_app/core/constants/constant.dart';
import 'package:prod_app/feature/auth/presentation/pages/desktop/desktop_login_page.dart';
import 'package:prod_app/feature/auth/presentation/pages/desktop/desktop_register_page.dart';
import 'package:prod_app/feature/auth/presentation/pages/mobile/mobile_login_page.dart';
import 'package:prod_app/feature/auth/presentation/pages/mobile/mobile_register_page.dart';

class AuthPageLoader extends StatefulWidget {
  const AuthPageLoader({super.key});

  @override
  State<AuthPageLoader> createState() => _AuthPageLoaderState();
}

class _AuthPageLoaderState extends State<AuthPageLoader> {
  bool signUpState = false;
  void _toggleLoggin()=>setState(() {
    signUpState = !signUpState;
  });
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if(signUpState){
      if(width>ScreenBreakPoints.mobile){
        return DesktopRegisterPage(
        toggleAuth:_toggleLoggin,
      );
      }
      else{
        return MobileRegisterPage(
          toggleAuth: _toggleLoggin,
        );
      }
      
    }
    else{
      if(width>ScreenBreakPoints.mobile){
        return DesktopLoginPage(toggleAuth: _toggleLoggin);
      }
      else{
        return MobileLoginPage(
          toggleAuth:_toggleLoggin,
      );
      }
      
    }
  }
}