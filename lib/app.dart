import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:prod_app/core/theme/theme.dart';
import 'package:prod_app/feature/auth/data/firebase_auth_repo.dart';
import 'package:prod_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:prod_app/feature/auth/presentation/cubits/auth_states.dart';
import 'package:prod_app/feature/auth/presentation/pages/auth_page_loader.dart';
import 'package:prod_app/feature/home/presentation/pages/home_page_loader.dart';

class App extends StatelessWidget {
  final FirebaseAuthRepo firebaseAuthRepo = FirebaseAuthRepo();
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(firebaseAuthRepo: firebaseAuthRepo)..getAppUser(),
        ),
      ],
      child: NeumorphicApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: darktheme,
        home: BlocConsumer<AuthCubit, AuthStates>(
          builder: (context, state) {
            if (state is Authenticated) {
              return HomePageLoader(user: state.user);
            } else if (state is Unauthenticated){
              return AuthPageLoader();
            }
            else{
              return Scaffold(
                backgroundColor: NeumorphicTheme.baseColor(context),
                body: Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: NeumorphicTheme.accentColor(context), 
                    size: 50
                  ),
                ),
              );
            }
          },
          listener: (context, state) {
            if (state is AuthError) {
              final messenger = ScaffoldMessenger.of(context);
              messenger.showMaterialBanner(
                MaterialBanner(
                  backgroundColor: Colors.red,
                  dividerColor: Colors.red,
                  contentTextStyle: TextStyle(
                    color: NeumorphicTheme.accentColor(context),
                  ),
                  content: Text(
                    "Both Email & Password is Required in Order to Sign in!",
                  ),
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
              Future.delayed(Duration(seconds: 3), () {
                messenger.hideCurrentMaterialBanner();
              });
            }
          },
        ),
      ),
    );
  }
}
