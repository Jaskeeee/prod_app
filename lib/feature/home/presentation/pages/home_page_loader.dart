import 'package:flutter/widgets.dart';
import 'package:prod_app/core/constants/constant.dart';
import 'package:prod_app/feature/auth/domain/model/app_user.dart';
import 'package:prod_app/feature/home/presentation/pages/desktop/desktop_home_page.dart';
import 'package:prod_app/feature/home/presentation/pages/mobile/mobile_home_page.dart';

class HomePageLoader extends StatelessWidget {
  final AppUser? user;
  const HomePageLoader({
    super.key,
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if(width>ScreenBreakPoints.mobile){
      return DesktopHomePage(user: user);
    }
    else{
      return MobileHomePage(user: user);
    }
  }
}