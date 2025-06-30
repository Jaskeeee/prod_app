import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/widgets/action_button.dart';
import 'package:prod_app/core/widgets/date_picker_widget.dart';
import 'package:prod_app/core/widgets/input_text_field.dart';
import 'package:prod_app/feature/home/presentation/pages/desktop/components/dashboard_toggle_element.dart';
import 'package:prod_app/feature/home/presentation/pages/desktop/components/expanded_textfield.dart';
import 'package:prod_app/feature/home/presentation/pages/desktop/components/rect_catgeogry_tile.dart';

class CategoryDialogs {
  void addCategoryDialog(
    BuildContext context,
    TextEditingController controller,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        int selectedIndex = 0;
        bool toggle = false;
        Color? selectedColor,selectedNoteColor = Colors.blue;
        DateTime selectedDate;
        IconData? selectedIcon = Icons.sentiment_satisfied_alt_rounded;

        return StatefulBuilder(
          builder: (context, state) {
            return AlertDialog.adaptive(
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: [
                ActionButton(
                  onTap: () => Navigator.of(context).pop(),
                  title: "Close",
                ),
                ActionButton(onTap: () {}, title: "Save"),
              ],
              title: Row(
                children: [
                  Icon(
                    Icons.category_outlined,
                    size: 30,
                    color: NeumorphicTheme.accentColor(context),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Add Category",
                    style: TextStyle(
                      color: NeumorphicTheme.accentColor(context),
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              backgroundColor: NeumorphicTheme.baseColor(context),
              content: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 800, maxWidth: 1200),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InputTextField(
                              controller: controller,
                              hintText: "Enter a Text",
                              obscureText: false,
                              suffixIcon: Icons.edit_outlined,
                            ),
                            SizedBox(height: 30),
                            RectCatgeogryTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedColor,
                                ),
                                width: 50,
                                height: 50,
                              ),
                              title: "Selected Color",
                            ),
                            SizedBox(height: 20),
                            RectCatgeogryTile(
                              leading: Icon(
                                selectedIcon,
                                color: NeumorphicTheme.accentColor(context),
                                size: 50,
                              ),
                              title: "Selected Icon",
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: ExpandedTextfield(
                                controller: controller,
                                hintText: "Add a note (optional)", 
                                onTap: (){
                                  
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    Flexible(
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            NeumorphicToggle(
                              height: 65,
                              displayForegroundOnlyIfSelected: true,
                              selectedIndex: selectedIndex,
                              style: NeumorphicToggleStyle(),
                              children: [
                                ToggleElement(
                                  foreground: DashboardToggleElement(
                                    iconData: Icons.color_lens_outlined,
                                    title: "Color",
                                  ),
                                  background: DashboardToggleElement(
                                    iconData: Icons.color_lens_outlined,
                                    title: "Color",
                                  ),
                                ),
                                ToggleElement(
                                  foreground: DashboardToggleElement(
                                    iconData: Icons.calendar_month_outlined,
                                    title: "Date",
                                  ),
                                  background: DashboardToggleElement(
                                    iconData: Icons.calendar_month_outlined,
                                    title: "Date",
                                  ),
                                ),
                              ],
                              thumb: Neumorphic(
                                style: NeumorphicStyle(
                                  lightSource: LightSource.topLeft,
                                  surfaceIntensity: 0.2,
                                  intensity: 0.8,
                                  depth: 6,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                state(() {
                                  selectedIndex = value;
                                  toggle = !toggle;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            Flexible(
                              flex: 5,
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  color: NeumorphicTheme.baseColor(context),
                                  depth: -6,
                                  intensity: 0.6,
                                  surfaceIntensity: 0.3,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(15),
                                  ),
                                ),
                                child: Container(
                                  child: toggle
                                      ? DatePickerWidget()
                                      : ColorPicker(
                                          width: 50,
                                          height: 50,
                                          showRecentColors: true,
                                          padding: EdgeInsetsGeometry.all(10),
                                          pickerTypeTextStyle: TextStyle(
                                            color: NeumorphicTheme.accentColor(
                                              context,
                                            ),
                                            fontSize: 18,
                                          ),
                                          colorNameTextStyle: TextStyle(
                                            color: NeumorphicTheme.accentColor(
                                              context,
                                            ),
                                            fontSize: 18,
                                          ),
                                          colorCodeTextStyle: TextStyle(
                                            color: NeumorphicTheme.accentColor(
                                              context,
                                            ),
                                            fontSize: 18,
                                          ),
                                          showColorCode: true,
                                          showColorValue: true,
                                          onColorChanged: (color) => state(
                                            () => selectedColor = color,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
