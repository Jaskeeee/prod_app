import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/constants/constant.dart';
import 'package:prod_app/core/widgets/action_button.dart';
import 'package:prod_app/feature/auth/data/helper/auth_helper.dart';
import 'package:prod_app/feature/auth/presentation/components/auth_divider.dart';
import 'package:prod_app/core/widgets/input_text_field.dart';
import 'package:prod_app/feature/auth/presentation/components/service_signin_button.dart';
import 'package:prod_app/feature/auth/presentation/cubits/auth_cubit.dart';

class DesktopLoginPage extends StatefulWidget {
  final void Function() toggleAuth;
  const DesktopLoginPage({super.key, required this.toggleAuth});

  @override
  State<DesktopLoginPage> createState() => _DesktopLoginPageState();
}

class _DesktopLoginPageState extends State<DesktopLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final AuthHelper _authHelper = AuthHelper();
  bool pwdObscure = true;
  
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
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NeumorphicText(
                    "Sign in",
                    style: NeumorphicStyle(
                      color: NeumorphicTheme.accentColor(context),
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                SizedBox(height: 15),
                NeumorphicText(
                  "Let's get you back on track!",
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.defaultTextColor(context),
                  ),
                  textStyle: NeumorphicTextStyle(fontSize: 18),
                ),
                  SizedBox(height: 30),
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
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: ActionButton(
                      onTap: () => _authHelper.login(
                        context,
                        emailController,
                        pwdController
                      ), title: "Sign in"),
                  ),
                  SizedBox(height: 40),
                  AuthDivider(),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ServiceSigninButton(
                        svg: googleSvg,
                        onTap: () => context.read<AuthCubit>().googleSignIn(),
                      ),
                      SizedBox(width:20,),
                      ServiceSigninButton(
                        svg: microsoftSvg,
                        onTap: (){},
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeumorphicText(
                        "New Here?",
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.defaultTextColor(context),
                        ),
                        textStyle: NeumorphicTextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: widget.toggleAuth,
                        child: NeumorphicText(
                          "Register now.",
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
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: IconButton(
          onPressed: (){print("you pressed it lmao");},
          icon: Icon(
            Icons.light_mode_outlined,
            color: NeumorphicTheme.defaultTextColor(context),
            size: 30,
          ),
        ),
      );
    }
  }
