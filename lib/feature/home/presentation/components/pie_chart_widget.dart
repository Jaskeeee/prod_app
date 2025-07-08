import 'package:circlify/circlify.dart';
import 'package:circlify/circlify_item.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

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
      child: Stack(
        children: [
        Circlify(items: items),
        Text(
          "20%",
          style: TextStyle(
            color: NeumorphicTheme.accentColor(context),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        )
      ]),
    );
  }
}
