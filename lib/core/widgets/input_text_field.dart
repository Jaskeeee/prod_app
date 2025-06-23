import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class InputTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final IconData suffixIcon;
  final void Function()? onTap;
  const InputTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.suffixIcon,
    this.onTap
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -6,
        intensity: 0.6,
        surfaceIntensity: 0.2,
        color: NeumorphicTheme.baseColor(context), 
        lightSource: LightSource.topLeft,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
      ),
      padding: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed:widget.onTap,
              icon: Icon(
                widget.suffixIcon,
              ),
            ),
            hintText: widget.hintText, 
            hintStyle: TextStyle(color:NeumorphicTheme.defaultTextColor(context)),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
