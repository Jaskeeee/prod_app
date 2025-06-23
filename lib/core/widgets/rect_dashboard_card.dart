import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class RectDashboardCard extends StatelessWidget {
  final Widget? child;
  const RectDashboardCard({
    super.key,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 6,
        intensity: 0.8,
        surfaceIntensity: 0.2,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
        color: NeumorphicTheme.baseColor(context),
      ),
      margin: EdgeInsets.all(30),
      child: Container(
        child: Center(child: child),
      )
    );
  }
}