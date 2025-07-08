import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class ExpandedTextfield extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onTap;
  final String hintText;
  
  const ExpandedTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: NeumorphicTheme.baseColor(context),
        depth: -6,
        intensity: 0.8,
        surfaceIntensity: 0.2,
        lightSource: LightSource.topLeft,
      ),
      padding: EdgeInsets.symmetric(horizontal:15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          suffix: IconButton(
            padding: EdgeInsets.zero,
            onPressed: onTap, 
            icon: Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Icon(
                Icons.color_lens_outlined,
                size: 30,
              ),
            )
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: NeumorphicTheme.defaultTextColor(context)
          ),
        ),
      ),
    );
  }
}