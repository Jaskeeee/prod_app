import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/data/side_bar_item_data.dart';

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
      margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
      style: NeumorphicStyle(
        depth: 10,
        surfaceIntensity:0.4,
        intensity: 0.8,
        color: NeumorphicTheme.baseColor(context),
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(80)),
        shadowLightColor: const Color.fromARGB(255, 45, 45, 45),
        shadowDarkColor: Colors.black87,
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
              onPressed: () {},
              icon: Icon(Icons.logout, color: Colors.grey.shade700),
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
          color: isSelected ? Colors.white : Colors.grey.shade700,
          size: 30,
        ),
      ),
    );
  }
}
