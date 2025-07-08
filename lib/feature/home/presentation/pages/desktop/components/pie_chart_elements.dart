import 'package:circlify/circlify.dart';
import 'package:circlify/circlify_item.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/widgets/dashboard_card.dart';
import 'package:simple_heatmap_calendar/simple_heatmap_calendar.dart';

class PieChartElements extends StatelessWidget {
  PieChartElements({super.key});
  final List<CirclifyItem> items = <CirclifyItem>[
    CirclifyItem(id: 'red', color: Colors.red, value: 10),
    CirclifyItem(id: 'green', color: Colors.green, value: 20),
    CirclifyItem(id: 'blue', color: Colors.blue, value: 30),
    CirclifyItem(id: 'blue', color: Colors.yellow, value: 40),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DashboardCard(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Circlify(items: items),
                Text(
                  "20%",
                  style: TextStyle(
                    color: NeumorphicTheme.accentColor(context),
                    fontSize: 80,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: DashboardCard(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: HeatmapCalendar<num>(
                  startDate: DateTime.now(),
                  endedDate: DateTime(2099, 12, 31),
                  colorMap: {
                    10: Colors.green.withOpacity(0.2),
                    20: Colors.green.withOpacity(0.4),
                    30: Colors.green.withOpacity(0.6),
                    40: Colors.green.withOpacity(0.8),
                    50: Colors.green,
                  },
                  selectedMap: {
                    DateTime(2025, 12, 31): 10,
                    DateTime(2025, 12, 30): 20,
                    DateTime(2025, 12, 29): 30,
                    DateTime(2025, 12, 28): 40,
                    DateTime(2025, 12, 26): 50,
                    DateTime(2025, 12, 22): 60,
                    DateTime(2025, 12, 12): 999,
                    DateTime(2025, 12, 1): 0,
                    DateTime(2025, 11, 23): 12,
                    DateTime(2025, 12, 16): 34,
                    DateTime(2025, 12, 15): 45,
                    DateTime(2025, 12, 12): 89,
                    DateTime(2020, 1, 16): 34,
                    DateTime(2020, 1, 15): 45,
                    DateTime(2020, 1, 12): 89,
                  },
                  cellSize: const Size.square(40.0),
                  colorTipCellSize: const Size.square(12.0),
                  style: const HeatmapCalendarStyle.defaults(
                    cellValueFontSize: 6.0,
                    cellRadius: BorderRadius.all(Radius.circular(4.0)),
                    weekLabelValueFontSize: 12.0,
                    monthLabelFontSize: 12.0,
                  ),
                  layoutParameters: const HeatmapLayoutParameters.defaults(
                    monthLabelPosition: CalendarMonthLabelPosition.top,
                    weekLabelPosition: CalendarWeekLabelPosition.right,
                    colorTipPosition: CalendarColorTipPosition.bottom,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
