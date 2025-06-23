import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:30,right: 30),
          child: Divider(
            thickness: 1,
            color: NeumorphicTheme.defaultTextColor(context),
          ),
        ),
        Container(
          color: NeumorphicTheme.baseColor(context),
          padding: EdgeInsets.all(10),
          child: Text(
            "or",
            style: TextStyle(
              color: NeumorphicTheme.defaultTextColor(context),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}