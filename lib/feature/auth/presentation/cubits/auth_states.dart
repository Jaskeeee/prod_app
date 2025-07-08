import 'package:prod_app/feature/auth/domain/model/app_user.dart';

sealed class AuthStates {}
class AuthInitial extends AuthStates{}
class AuthLoading extends AuthStates{}
class Unauthenticated extends AuthStates{}
class AuthError extends AuthStates{
  final String message;
  AuthError(this.message);
}
class Authenticated extends AuthStates{
  AppUser? user;
  Authenticated(this.user); 
}