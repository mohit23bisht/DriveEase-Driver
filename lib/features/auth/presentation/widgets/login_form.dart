import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/login_cubit.dart';
import 'app_logo.dart';
import 'app_text_field.dart';
import 'primary_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<LoginCubit>().state is LoginLoading;

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
    
          child: Image.asset(
            'assets/images/bg.png',
    
            width: double.infinity,
    
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(child: const AppLogo()),
                
                  Row(
                    children: [
                      Text(
                        "Sign in",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Spacer()
                    ],
                  ),
                
                  const SizedBox(height: 15),
                
                 
                
                  AppTextField(
                    controller: emailController,
                    hint: "Email",
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                
                      return null;
                    },
                  ),
                
                  const SizedBox(height: 20),
                
                  AppTextField(
                    controller: passwordController,
                    hint: "Password",
                    icon: Icons.lock_outline,
                    obscureText: obscure,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return "Minimum 6 characters";
                      }
                      return null;
                    },
                  ),
                
                  const SizedBox(height: 10),
                
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
                    ),
                  ),
                
                  const SizedBox(height: 20),
                
                  PrimaryButton(
                    loading: loading,
                    text: "LOGIN",
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                
                      context.read<LoginCubit>().login(
                        email: emailController.text.trim(),
                        password: passwordController.text,
                      );
                    },
                  ),
                
                  const SizedBox(height: 30),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                
                      TextButton(
                        onPressed: () {
                          context.push('/signup');
                        },
                        child: const Text("Sign Up"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
