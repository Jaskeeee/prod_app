import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class RectCatgeogryTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget? trailing;
  final void Function()? onTap;
  const RectCatgeogryTile({
    super.key,
    required this.leading,
    required this.title,
    this.trailing,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: NeumorphicTheme.baseColor(context),
        depth: 6,
        intensity: 0.8,
        surfaceIntensity: 0.2,
        lightSource: LightSource.top,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(20),
      child: ListTile(
        leading: leading,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(title),
        ),
        titleTextStyle: TextStyle(
          color: NeumorphicTheme.accentColor(context),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
