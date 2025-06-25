import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/feature/auth/domain/model/app_user.dart';
import 'package:prod_app/feature/auth/presentation/cubits/auth_cubit.dart';

class MobileHomePage extends StatefulWidget {
  final AppUser? user;
  const MobileHomePage({super.key, required this.user});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: NeumorphicAppBar(
        actions: [
          IconButton(
            onPressed: (){
              context.read<AuthCubit>().logout();
            }, 
            icon: Icon(
              Icons.logout_outlined,
              size: 30,
            )
          )
        ],
        color: NeumorphicTheme.baseColor(context),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: NeumorphicTheme.baseColor(context),
            expandedHeight: 500,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Neumorphic(
                style: NeumorphicStyle(
                  color: NeumorphicTheme.baseColor(context),
                  lightSource: LightSource.bottom,
                  depth: 6,
                  intensity: 0.8,
                  surfaceIntensity: 0.2,
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(15),
                  ),
                ),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(child: Center())),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: Neumorphic(
                style: NeumorphicStyle(
                  lightSource: LightSource.bottom,
                  depth:6,
                  intensity: 0.8,
                  surfaceIntensity: 0.2,
                  color: NeumorphicTheme.baseColor(context),
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)
                  ))
                ),
                child: Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: NeumorphicTheme.defaultTextColor(context),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 10,
                    width: 50,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Neumorphic(
                style: NeumorphicStyle(
                  color: NeumorphicTheme.baseColor(context),
                  depth: 6,
                  oppositeShadowLightSource: false,
                  intensity: 0.8,
                  surfaceIntensity: 0.2,
                ),
                margin: EdgeInsets.symmetric(horizontal:15,vertical:5),
                child:ListTile( 
                  title: Text(index.toString()),
                ),
              );
            }
          ),
          ),
        ],
      ),
    );
  }
}
