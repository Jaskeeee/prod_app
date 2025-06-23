import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/widgets/rect_dashboard_card.dart';
import 'package:prod_app/core/widgets/side_bar.dart';
import 'package:prod_app/feature/auth/domain/model/app_user.dart';
import 'package:prod_app/feature/home/presentation/pages/desktop/pie_chart_elements.dart';

class DesktopHomePage extends StatelessWidget {
  final AppUser? user;
  const DesktopHomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: Row(
          children: [
            SizedBox(width: 20),
            SideBar(),
            SizedBox(width: 20),
            PieChartElements(),
            Expanded(child: RectDashboardCard()),
            Expanded(child: RectDashboardCard()),
          ],
        ),
      ),
    );
  }
}
