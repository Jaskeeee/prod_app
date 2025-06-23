import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/widgets/action_button.dart';
import 'package:prod_app/feature/auth/presentation/components/auth_divider.dart';
import 'package:prod_app/core/widgets/input_text_field.dart';
import 'package:prod_app/feature/auth/presentation/components/google_signin_button.dart';
import 'package:prod_app/feature/auth/presentation/cubits/auth_cubit.dart';

class DesktopRegisterPage extends StatefulWidget {
  final void Function() toggleAuth;
  const DesktopRegisterPage({super.key, required this.toggleAuth});

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
  bool showPasswordField = false;

  void showError(String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.showMaterialBanner(
      MaterialBanner(
        backgroundColor: Colors.red,
        dividerColor: Colors.red,
        contentTextStyle: TextStyle(
          color: NeumorphicTheme.accentColor(context),
        ),
        content: Text(message),
        actions: [
          IconButton(
            onPressed: () => messenger.hideCurrentMaterialBanner(),
            icon: Icon(
              Icons.close,
              color: NeumorphicTheme.accentColor(context),
            ),
          ),
        ],
      ),
    );
    Future.delayed(const Duration(seconds: 3), () {
      messenger.hideCurrentMaterialBanner();
    });
  }

  void register() {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String pass = pwdController.text;
    final String confpass = confPwdController.text;

    final authCubit = context.read<AuthCubit>();

    if (name.isNotEmpty && email.isNotEmpty) {
      if (pass.isNotEmpty && confpass.isNotEmpty) {
        if (pass == confpass) {
          authCubit.register(name, email, pass);
        } else {
          showError("Passwords do not match!");
        }
      } else {
        showError("Please enter both password fields.");
      }
    } else {
      showError("Name and Email are required.");
    }
  }

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
                Row(
                  children: [
                    Visibility(
                      visible: showPasswordField,
                      child: IconButton(
                        onPressed: () => setState(() {
                          showPasswordField = false;
                        }),
                        icon: Icon(Icons.arrow_back, size: 30),
                      ),
                    ),
                    Visibility(
                      visible: showPasswordField,
                      child: SizedBox(width: 20),
                    ),
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
                  ],
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
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: showPasswordField
                      ? Column(
                          key: ValueKey('passwordFileds'),
                          children: [
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
                            SizedBox(height: 20),
                            InputTextField(
                              suffixIcon: confPwdObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              controller: confPwdController,
                              hintText: "Confirm Password",
                              obscureText: confPwdObscure,
                              onTap: () => setState(() {
                                confPwdObscure = !confPwdObscure;
                              }),
                            ),
                            SizedBox(height: 40),
                            Align(
                              alignment: Alignment.center,
                              child: ActionButton(
                                onTap: () => register(),
                                title: "Register",
                              ),
                            ),
                          ],
                        )
                      : Column(
                          key: ValueKey('nameTextfield'),
                          children: [
                            InputTextField(
                              suffixIcon: Icons.account_circle_outlined,
                              controller: nameController,
                              hintText: "Name",
                              obscureText: false,
                            ),
                            SizedBox(height: 20),
                            InputTextField(
                              suffixIcon: Icons.mail_outline,
                              controller: emailController,
                              hintText: "Email",
                              obscureText: false,
                            ),
                            SizedBox(height: 40),
                            Align(
                              alignment: Alignment.center,
                              child: ActionButton(
                                onTap: () {
                                  if(nameController.text.isNotEmpty &&emailController.text.isNotEmpty) {
                                    setState(() {
                                      showPasswordField = !showPasswordField;
                                    });
                                  }
                                  else{
                                    showError("Name and Email are required in order to Register!");
                                  }
                                },
                                title: "Next",
                              ),
                            ),
                          ],
                        ),
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
                      onTap: widget.toggleAuth,
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
