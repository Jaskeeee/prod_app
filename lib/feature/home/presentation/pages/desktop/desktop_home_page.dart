import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/widgets/rect_dashboard_card.dart';
import 'package:prod_app/core/widgets/side_bar.dart';
import 'package:prod_app/feature/auth/domain/model/app_user.dart';
import 'package:prod_app/feature/home/presentation/components/category_list_widget.dart';
import 'package:prod_app/feature/home/presentation/pages/desktop/components/pie_chart_elements.dart';
import 'package:prod_app/feature/home/presentation/pages/desktop/dialogs/category_dialogs.dart';

class DesktopHomePage extends StatefulWidget {
  final AppUser? user;
  const DesktopHomePage({super.key, required this.user});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  final TextEditingController titleController = TextEditingController();
  final CategoryDialogs _categoryDialogs = CategoryDialogs();

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
            Expanded(child: CategoryListWidget()),
            Expanded(child: RectDashboardCard()),
          ],
        ),
        floatingActionButton: NeumorphicFloatingActionButton(
          style: NeumorphicStyle(
            depth: 6,
            intensity: 0.5,
            color: NeumorphicTheme.baseColor(context)
          ),
          child:Icon(
            Icons.add,
            size: 30,
            color: NeumorphicTheme.accentColor(context),
          ), 
          onPressed:()=> _categoryDialogs.addCategoryDialog(context,titleController)
        ),
      ),
    );
  }
}
