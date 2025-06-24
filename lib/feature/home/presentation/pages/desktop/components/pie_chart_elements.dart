import 'package:circlify/circlify.dart';
import 'package:circlify/circlify_item.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/widgets/dashboard_card.dart';

class PieChartElements extends StatelessWidget {
  PieChartElements({super.key});
final List<CirclifyItem> items = <CirclifyItem>[
  CirclifyItem(
    id: 'red',
    color: Colors.red,
    value: 10,
  ),
  CirclifyItem(
    id: 'green',
    color: Colors.green,
    value: 20,
  ),
  CirclifyItem(
    id: 'blue',
    color: Colors.blue,
    value: 30,
  ),
  CirclifyItem(
    id: 'blue',
    color: Colors.yellow,
    value: 40,
  ),
];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: DashboardCard(child: Circlify(items:items,))),
        Expanded(child: DashboardCard(child: Text("data"))),
      ],
    );
  }
}
