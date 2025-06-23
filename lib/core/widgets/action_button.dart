import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const ActionButton({
    super.key,
    required this.onTap,
    required this.title
  });
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onTap,
      style: NeumorphicStyle(
        lightSource: LightSource.top,
        intensity: 0.7,
        surfaceIntensity: 0.2,
        depth: 6,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        color:NeumorphicTheme.baseColor(context)
      ),
      padding:EdgeInsets.fromLTRB(80, 20, 80, 20),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
    );
  }
}