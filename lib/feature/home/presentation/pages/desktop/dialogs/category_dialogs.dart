import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/widgets/input_text_field.dart';

class CategoryDialogs {
  void addCategoryDialog(
    BuildContext context,
    TextEditingController controller,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
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
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
  }
}
