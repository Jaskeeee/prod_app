import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class ColorIconButtons extends StatefulWidget {
  const ColorIconButtons({super.key});

  @override
  State<ColorIconButtons> createState() => _ColorIconButtonsState();
}

class _ColorIconButtonsState extends State<ColorIconButtons> {
  String? groupValue="Color";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NeumorphicRadio(
          value: groupValue,
          onChanged: (value) =>setState(() {
            groupValue = "Icon";
          }),
          child: Row(
            children: [
              Icon(
                Icons.palette_outlined,
                color: NeumorphicTheme.accentColor(context),
                size: 20,
              ),
              Text(
                "Color",
                style: TextStyle(
                  color: NeumorphicTheme.accentColor(context),
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        NeumorphicRadio(
          value: "Icon",
        )
      ],
    );
  }
}