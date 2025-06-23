import 'package:flutter/material.dart';
import 'package:prod_app/feature/auth/presentation/pages/desktop/desktop_login_page.dart';
import 'package:prod_app/feature/auth/presentation/pages/desktop/desktop_register_page.dart';

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
    if(signUpState){
      return DesktopRegisterPage(
        toggleAuth:_toggleLoggin,
      );
    }
    else{
      return DesktopLoginPage(
        toggleAuth:_toggleLoggin,
      );
    }
  }
}