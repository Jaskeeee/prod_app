import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/widgets/side_bar.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: Row(
          children: [
            SizedBox(width:20,),
            SideBar(),
            SizedBox(width:20,),
            Expanded(
              flex:6,
              child: Container(color:NeumorphicTheme.baseColor(context)),
            )
          ],
        )
      ),
    );
  }
}
