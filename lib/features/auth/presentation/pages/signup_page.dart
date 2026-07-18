import 'package:driveease_driver/core/di/service_locator.dart';
import 'package:driveease_driver/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:driveease_driver/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignupCubit>(),
      child: const Scaffold(
        body: SafeArea(
          child: SignupForm(),
        ),
      ),
    );
  }
}