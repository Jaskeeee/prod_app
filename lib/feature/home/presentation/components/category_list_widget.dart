import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/widgets/rect_dashboard_card.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RectDashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25,10,25,10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      NeumorphicIcon(
                        Icons.category_outlined,
                        size: 30,
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.accentColor(context)
                        ),
                      ),
                      SizedBox(width:10,),
                      NeumorphicText(
                        "Categories:",
                        style: NeumorphicStyle(color: NeumorphicTheme.accentColor(context)),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed:(){}, 
                  icon: Icon(
                    Icons.add,
                    color: NeumorphicTheme.accentColor(context),
                    size: 30,
                  )
                )
              ],
            ),
          ),
          Expanded(
            child: Neumorphic(
              style: NeumorphicStyle(
                color: NeumorphicTheme.baseColor(context),
                depth: -6,
                intensity: 0.5,
                surfaceIntensity: 0.2,
                lightSource: LightSource.topLeft,
              ),
              margin: EdgeInsets.only(left:25,bottom:25,right:25,top:10),
              child: ScrollConfiguration(
                behavior:ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Neumorphic(
                      style: NeumorphicStyle(
                        color: NeumorphicTheme.baseColor(context),
                        depth: 6,
                        intensity: 0.6,
                        lightSource: LightSource.topLeft,
                      ),
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal:15,vertical:10),
                      textStyle: TextStyle(
                        color: NeumorphicTheme.accentColor(context),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      child: ListTile(title: Text(index.toString())),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
