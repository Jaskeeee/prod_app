import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:prod_app/feature/auth/presentation/cubits/auth_cubit.dart';

class AuthHelper {
  void showError(BuildContext context, String message) {
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

  void login(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController pwdController,
  ) {
    final String email = emailController.text;
    final String pwd = pwdController.text;
    final authCubit = context.read<AuthCubit>();
    if (email.isNotEmpty && pwd.isNotEmpty) {
      authCubit.login(email, pwd);
    } else {
      showError(
        context,
        "Both Email & Password is Required in Order to Sign in!",
      );
    }
  }

  void register(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController pwdController,
    TextEditingController confPwdController,
  ) {
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
          showError(context, "Passwords do not match!");
        }
      } else {
        showError(context, "Please enter both password fields.");
      }
    } else {
      showError(context, "Name and Email are required.");
    }
  }
}
