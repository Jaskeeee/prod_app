import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/core/constants/constant.dart';
import 'package:prod_app/core/widgets/action_button.dart';
import 'package:prod_app/core/widgets/input_text_field.dart';
import 'package:prod_app/feature/auth/data/helper/auth_helper.dart';
import 'package:prod_app/feature/auth/presentation/components/auth_divider.dart';
import 'package:prod_app/feature/auth/presentation/components/service_signin_button.dart';
import 'package:prod_app/feature/auth/presentation/cubits/auth_cubit.dart';

class MobileLoginPage extends StatefulWidget {
  final void Function() toggleAuth;
  const MobileLoginPage({super.key, required this.toggleAuth});

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final AuthHelper _authHelper = AuthHelper();
  bool pwdObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NeumorphicTheme.baseColor(context),
        actions: [
          IconButton(
            onPressed: (){},
            icon:Icon(
              Icons.light_mode_outlined,
            )
          )
        ],
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                NeumorphicText(
                  "Sign in",
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.accentColor(context),
                    intensity: 0.1,
                    depth: 4,
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
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
                SizedBox(height: 50),
                InputTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                  suffixIcon: Icons.mail_outline,
                ),
                SizedBox(height: 20),
                InputTextField(
                  controller: pwdController,
                  hintText: "Password",
                  obscureText: pwdObscure,
                  suffixIcon: pwdObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: ActionButton(
                    onTap: () =>
                        _authHelper.login(context, emailController, pwdController),
                    title: "Sign in",
                  ),
                ),
                SizedBox(height: 40),
                AuthDivider(),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: ServiceSigninButton(
                    svg: googleSvg,
                    onTap: () => context.read<AuthCubit>().googleSignIn(),
                  ),
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
    );
  }
}
