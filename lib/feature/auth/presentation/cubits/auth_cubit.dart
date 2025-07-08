import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prod_app/feature/auth/data/firebase_auth_repo.dart';
import 'package:prod_app/feature/auth/domain/model/app_user.dart';
import 'package:prod_app/feature/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthStates>{
  final FirebaseAuthRepo firebaseAuthRepo;
  AuthCubit({
    required this.firebaseAuthRepo
  }):super(AuthInitial());

  void getAppUser()async{
    try{
      final AppUser? user = await firebaseAuthRepo.getAppUser();
      if(user!=null){
        emit(Authenticated(user));
      }
      else{
        emit(Unauthenticated());
      }
    }
    catch(e){
      emit(Unauthenticated());
      emit(AuthError(e.toString()));
    }    
  }



  void login(String email,String password)async{
    emit(AuthLoading());
    try{
      final AppUser? user = await firebaseAuthRepo.signInAppUser(email, password);
      if(user!=null){
        emit(Authenticated(user));
      }else{
        emit(Unauthenticated());
      }
    }
    catch(e){
      emit(Unauthenticated());
      emit(AuthError(e.toString()));
    }
  }

  void register(String name,String email,String password)async{
    emit(AuthLoading());
    try{
      final AppUser? user = await firebaseAuthRepo.registerAppUser(name, email, password);
      if(user!=null){
        emit(Authenticated(user));
      }
      else{
        emit(Unauthenticated());
      }
    }
    catch(e){
      emit(Unauthenticated());
      emit(AuthError(e.toString()));
    }
  }

  void logout()async{
    emit(AuthLoading());
    try{
      await firebaseAuthRepo.signOutAppUser();
      emit(Unauthenticated());
    }
    catch(e){
      emit(Unauthenticated());
      emit(AuthError(e.toString()));
    }
  }

  void googleSignIn()async{
    emit(AuthLoading());
    try{
      final AppUser? user = await firebaseAuthRepo.userGoogleSignIn();
      if(user!=null){
        emit(Authenticated(user));
      }
      else{
        emit(Unauthenticated());
      }
    }
    catch(e){
      emit(Unauthenticated());
      emit(AuthError(e.toString()));
    }
  }

}