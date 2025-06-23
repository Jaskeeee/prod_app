import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

NeumorphicThemeData darktheme = NeumorphicThemeData(
  lightSource: LightSource.top,
  accentColor: Colors.white,
  baseColor:Color.fromARGB(255, 30, 30, 30),
  depth: 6,
  intensity: 0.4,
  shadowLightColor: Color.fromARGB(255,25,25,25),
  shadowDarkColor: Colors.black87,
  shadowDarkColorEmboss:Colors.black87,
  shadowLightColorEmboss:Color.fromARGB(255,25,25,25),
  defaultTextColor: Colors.grey.shade800,
  variantColor: Color.fromARGB(255,40,40, 40),
  iconTheme: IconThemeData(
    color: Colors.grey.shade700,
  )
);

NeumorphicThemeData lighttheme = NeumorphicThemeData(
  lightSource: LightSource.top,
  accentColor: Colors.black87,
  depth: 6,
  intensity: 0.4,
  
);