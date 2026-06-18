import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                textEditingController: usernameController,
                hintText: 'Username',
                isObscure: false,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                textEditingController: passwordController,
                hintText: 'Password',
                isObscure: true,
              ),

              const SizedBox(height: 24),

              authState.isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      buttonText: 'Login',
                      onTap: () {
                        ref
                            .read(authProvider.notifier)
                            .login(
                              username: usernameController.text,
                              password: passwordController.text,
                            );
                      },
                    ),

              const SizedBox(height: 24),

              authState.when(
                data: (auth) {
                  final user = auth.user;

                  if (user == null) {
                    return const SizedBox();
                  }

                  return Text('Welcome ${user.username}');
                },
                loading: () => const SizedBox(),
                error: (e, st) => Text(
                  e.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
