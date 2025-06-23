import 'package:circlify/circlify.dart';
import 'package:circlify/circlify_item.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  PieChartWidget({super.key});
final List<CirclifyItem> items = <CirclifyItem>[
  CirclifyItem(color: Colors.red, value: 0.1),
  CirclifyItem(color: Colors.yellow, value: 0.2),
  CirclifyItem(color: Colors.blue, value: 0.3),
  CirclifyItem(color: Colors.green, value: 0.4),
];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Circlify(
        items: items
      ));
  }
}