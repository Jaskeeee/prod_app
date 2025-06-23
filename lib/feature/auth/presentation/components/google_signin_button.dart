import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prod_app/core/constants/constant.dart';

class GoogleSigninButton extends StatelessWidget {
  final void Function() onTap;
  const GoogleSigninButton({
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed:onTap,
      style: NeumorphicStyle(
        lightSource: LightSource.top,
        depth:6,
        surfaceIntensity: 0.2,
        intensity: 0.8,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
        color: NeumorphicTheme.baseColor(context)
      ),
      padding: EdgeInsets.all(20),
      child: SvgPicture.asset(
        googleSvg,
        width: 30,
        height: 30,
      ),
    );
  }
}