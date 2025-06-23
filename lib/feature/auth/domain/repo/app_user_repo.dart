
import 'package:prod_app/feature/auth/domain/model/app_user.dart';

abstract class AppUserRepo {
  Future<AppUser?> getAppUser();
  Future<AppUser?> signInAppUser(String email,String password);
  Future<AppUser?> registerAppUser(String name, String email,String password);
  Future<void> signOutAppUser();
  Future<AppUser?> userGoogleSignIn();
}