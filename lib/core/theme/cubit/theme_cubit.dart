import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/theme/theme.dart';

class ThemeCubit extends Cubit<NeumorphicThemeData>{
  ThemeCubit():super(lighttheme){
    _getThemeFromPrefs();
  }

  Future<void> _getThemeFromPrefs()async{
  }
}