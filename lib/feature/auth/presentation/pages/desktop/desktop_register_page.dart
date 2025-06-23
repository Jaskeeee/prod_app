import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/widgets/action_button.dart';
import 'package:prod_app/core/widgets/auth_divider.dart';
import 'package:prod_app/core/widgets/input_text_field.dart';
import 'package:prod_app/feature/auth/presentation/components/google_signin_button.dart';

class DesktopRegisterPage extends StatefulWidget {
  final void Function() toggleAuth;
  const DesktopRegisterPage({
    super.key,
    required this.toggleAuth
  });

  @override
  State<DesktopRegisterPage> createState() => _DesktopLoginPageState();
}

class _DesktopLoginPageState extends State<DesktopRegisterPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController confPwdController = TextEditingController();

  bool pwdObscure = true;
  bool confPwdObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Center(
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: 10,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            surfaceIntensity: 0.2,
            intensity: 0.8,
            color: NeumorphicTheme.baseColor(context),
          ),
          child: Container(
            width: 500,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NeumorphicText(
                  "Register",
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.accentColor(context),
                    intensity: 0.1,
                    depth: 4,
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                SizedBox(height: 20),
                NeumorphicText(
                  "Let's get you started by signing you up!",
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.defaultTextColor(context),
                  ),
                  textStyle: NeumorphicTextStyle(fontSize: 18),
                ),
                SizedBox(height: 30),
                InputTextField(
                  suffixIcon: Icons.account_circle_outlined,
                  controller: emailController,
                  hintText: "Name",
                  obscureText: false,
                ),
                SizedBox(height: 20,),
                InputTextField(
                  suffixIcon: Icons.mail_outline,
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                SizedBox(height: 20),
                InputTextField(
                  suffixIcon: pwdObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  controller: pwdController,
                  hintText: "Password",
                  obscureText: pwdObscure,
                  onTap: () => setState(() {
                    pwdObscure = !pwdObscure;
                  }),
                ),
                SizedBox(height: 20,),
                InputTextField(
                  suffixIcon: confPwdObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  controller: pwdController,
                  hintText: "Confirm Password",
                  obscureText: confPwdObscure,
                  onTap: () => setState(() {
                    confPwdObscure = !confPwdObscure;
                  }),
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: ActionButton(onTap: () {}, title: "Register Now"),
                ),
                SizedBox(height: 40),
                AuthDivider(),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: GoogleSigninButton(onTap: () {}),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NeumorphicText(
                      "Already Have an Account?",
                      style: NeumorphicStyle(
                        color: NeumorphicTheme.defaultTextColor(context),
                      ),
                      textStyle: NeumorphicTextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap:widget.toggleAuth,
                      child: NeumorphicText(
                        "Sign in.",
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.defaultTextColor(context),
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          print("Theme Change LMFAO");
        },
        icon: Icon(
          Icons.light_mode_outlined,
          color: NeumorphicTheme.defaultTextColor(context),
          size: 30,
        ),
      ),
    );
  }
}
