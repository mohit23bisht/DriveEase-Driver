import 'package:driveease_driver/core/widgets/app_logo.dart';
import 'package:driveease_driver/core/widgets/app_text_field.dart';
import 'package:driveease_driver/features/auth/presentation/widgets/password_strength.dart';
import 'package:driveease_driver/features/auth/presentation/widgets/primary_button.dart';
import 'package:driveease_driver/features/auth/presentation/widgets/terms_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/signup_cubit.dart';
import '../cubit/signup_state.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},

      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                const AppLogo(),

                const SizedBox(height: 10),

                Center(
                  child: Text(
                    "Create Account",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                const SizedBox(height: 20),

                // AppTextField(controller: nameController, hintText: "Full Name"),

                // const SizedBox(height: 16),

                AppTextField(controller: emailController, hintText: "Email"),

                const SizedBox(height: 16),

                AppTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),

                //const SizedBox(height: 12),

                PasswordStrength(password: passwordController.text),

                //const SizedBox(height: 16),

                AppTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),

                const SizedBox(height: 18),

                TermsCheckbox(
                  value: isAccepted,

                  onChanged: (value) {
                    setState(() {
                      isAccepted = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 20),

                PrimaryButton(
                  text: "Create Account",
                  loading: false,
                  onPressed: () {
                    context.read<SignupCubit>().signup(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),

                    TextButton(onPressed: () {
                      context.pop();
                    }
                    , child: const Text("Login")),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
