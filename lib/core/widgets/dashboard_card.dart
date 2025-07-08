import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class DashboardCard extends StatelessWidget {
  final Widget? child;
  const DashboardCard({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double side = constraints.maxHeight < constraints.maxWidth
            ? constraints.maxHeight
            : constraints.maxWidth;

        return Center(
          child: SizedBox(
            width: side,
            height: side,
            child: Neumorphic(
              style: NeumorphicStyle(
                lightSource: LightSource.top,
                depth: 6,
                intensity: 0.8,
                surfaceIntensity: 0.2,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                color: NeumorphicTheme.baseColor(context),
              ),
              margin: EdgeInsets.all(30),
              padding: const EdgeInsets.all(25),
              child: Center(child: child),
            ),
          ),
        );
      },
    );
  }
}
