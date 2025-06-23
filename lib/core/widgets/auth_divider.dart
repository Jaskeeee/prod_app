import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: NeumorphicTheme.baseColor(context),
          child: Center(
            child: Text(
              "Or",
              style: TextStyle(
                color: NeumorphicTheme.defaultTextColor(context),
                backgroundColor: NeumorphicTheme.baseColor(context)
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Divider(
            thickness: 1,
            color:NeumorphicTheme.variantColor(context),
          ),
        ),
      ],
    );
  }
}