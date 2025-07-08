import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class DashboardToggleElement extends StatelessWidget {
  final String title;
  final IconData iconData;
  const DashboardToggleElement({
    super.key,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        intensity: 0.6,
        depth: 6,
        surfaceIntensity: 0.3
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 22,
              color: NeumorphicTheme.accentColor(context),
            ),
            SizedBox(width:20,),
            Text(
              title,
              style: TextStyle(
                color: NeumorphicTheme.accentColor(context),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
