import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class SquareCategoryTile extends StatelessWidget {
  const SquareCategoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: NeumorphicTheme.baseColor(context),
        intensity: 0.6,
        depth: 6,
        surfaceIntensity: 0.2,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
      ),
      padding: EdgeInsets.all(20),
      child: Container(
        child: Center(
          child: Text(
            "Child",
            style: TextStyle(
              color: NeumorphicTheme.accentColor(context),
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
          )
        ),
      ),
    );
  }
}