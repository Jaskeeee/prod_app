import 'package:flutter/material.dart';
import 'package:prod_app/core/models/side_bar_item.dart';

class SideBarItemData{
  List<SideBarItem> items = <SideBarItem>[
    SideBarItem(icon:Icons.home_outlined, id: "Home", onTap: () {}),
    SideBarItem(icon:Icons.account_circle_outlined, id: "Profile", onTap: () {}),
    SideBarItem(icon:Icons.settings_outlined, id: "Settings", onTap: () {}),
    SideBarItem(icon:Icons.list_outlined, id: "Categories", onTap: () {}),
  ];
}
