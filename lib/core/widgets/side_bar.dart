import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/data/side_bar_item_data.dart';
import 'package:prod_app/feature/auth/presentation/cubits/auth_cubit.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final data = SideBarItemData();
    return Neumorphic(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
      style: NeumorphicStyle(
        lightSource: LightSource.top,
        depth: 10,
        surfaceIntensity:0.4,
        intensity: 0.8,
        color: NeumorphicTheme.baseColor(context),
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(80)),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 50),
        width: 100,
        child: Column(
          children: [
            ListView.builder(
              itemCount: data.items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => sideBarItemBuilder(data, index),
            ),
            Spacer(),
            IconButton(
              onPressed:(){}, 
              icon:Icon(Icons.light_mode_outlined,size: 30,),
            ),
            SizedBox(height: 30,),
            IconButton(
              onPressed: ()=>context.read<AuthCubit>().logout(),
              icon: Icon(Icons.logout,size: 30,),
            ),
          ],
        ),
      ),
    );
  }

  Widget sideBarItemBuilder(SideBarItemData data, int index) {
    bool isSelected = index == selectedIndex;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () => setState(() {
          selectedIndex = index;
        }),
        child: Icon(
          data.items[index].icon,
          color: isSelected 
          ? NeumorphicTheme.accentColor(context) 
          : NeumorphicTheme.defaultTextColor(context),
          size: 30,
        ),
      ),
    );
  }
}
