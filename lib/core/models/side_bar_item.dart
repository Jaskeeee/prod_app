import 'package:flutter/widgets.dart';

class SideBarItem {
  final String id;
  final IconData icon;
  final void Function() onTap;
  SideBarItem({
    required this.icon,
    required this.id,
    required this.onTap
  });
}