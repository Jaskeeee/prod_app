import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prod_app/feature/auth/domain/model/app_user.dart';
import 'package:prod_app/feature/auth/presentation/cubits/auth_cubit.dart';

class MobileHomePage extends StatefulWidget {
  final AppUser? user;
  const MobileHomePage({
    super.key,
    required this.user
  });

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is the home page lmao"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed:()=>context.read<AuthCubit>().logout(), 
            icon: Icon(
              Icons.logout_outlined,
              size: 30
            )
          ),    
        ],
      ),
    );
  }
}