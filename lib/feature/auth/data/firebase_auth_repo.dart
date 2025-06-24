import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prod_app/feature/auth/domain/model/app_user.dart';
import 'package:prod_app/feature/auth/domain/repo/app_user_repo.dart';

class FirebaseAuthRepo implements AppUserRepo{
  final _firebaesauth = FirebaseAuth.instance;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
  @override
  Future<AppUser?> getAppUser()async {
    try {
      final User? user =  _firebaesauth.currentUser;
      if(user!=null){
        return AppUser(
          uid: user.uid, 
          email: user.email!, 
          name: ""
        );
      }
      return null;
    } 
    catch(e){
      throw Exception("Unable to Fetch User : $e");
    }
  }

  @override
  Future<AppUser?> signInAppUser(String email,String password) async{
    try {
      final UserCredential userCredential= await _firebaesauth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      AppUser user = AppUser(
        uid: userCredential.user!.uid, 
        email: email, 
        name:""
      );
      return user; 
    } 
    catch(e){
      throw Exception("Unable to Sign the user in: $e");
    }
  }

  @override
  Future<void> signOutAppUser()async {
    try {
      await _firebaesauth.signOut();
    }
    catch(e){
      throw Exception("Uable to Sign the User out $e");
    }
  }

  @override
  Future<AppUser?> registerAppUser(String name, String email,String password)async {
    try {
      final UserCredential userCredential= await _firebaesauth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      AppUser user = AppUser(
        uid: userCredential.user!.uid, 
        email: email, 
        name: name
      );
      await userCollection.add(user.toJson());
      return user;
    }
    catch(e){
      throw Exception("Unable to register User: $e");
    }
  }

  @override
  Future<AppUser?> userGoogleSignIn()async{
    try{
      if(kIsWeb){
        final GoogleAuthProvider provider = GoogleAuthProvider().setCustomParameters({'prompt':'select_account'});
        final UserCredential  userCredential = await _firebaesauth.signInWithPopup(provider);
        final User? user = userCredential.user;
        if(user!=null){
          return AppUser(
            uid: user.uid, 
            email: user.email!, 
            name: user.displayName! 
          ); 
        }
        return null;
      }
      else{
        final GoogleSignInAccount? user = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleSignInAuthentication=await user!.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final fireuser = await _firebaesauth.signInWithCredential(credential);
        AppUser appUser = AppUser(
          uid: fireuser.user!.uid, 
          email: fireuser.user!.email!, 
          name: fireuser.user!.displayName!
        );
        return appUser;
      }
    }
    catch(e){
      throw Exception("Unable sign in user using google:$e");
    }
  }
  
  @override
  Future<AppUser?> userMicrosoftSignIn()async{
    try{
      print("Coming soon!");
    }
    catch(e){
      throw Exception("Unable to Sign in using Microsoft:$e");
    }
  }
}