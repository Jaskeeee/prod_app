import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class ButtonCap extends StatelessWidget {
  const ButtonCap({super.key});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: NeumorphicTheme.baseColor(context),
      ),
      child: Container(
        child: Row(
          children: [],
        )
      ),
    );
  }
}