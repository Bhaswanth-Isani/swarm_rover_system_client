import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/auth/application/application.dart';
import 'package:swarm_rover_system_client/auth/presentation/widgets/auth_button.dart';
import 'package:swarm_rover_system_client/auth/presentation/widgets/auth_text_button.dart';
import 'package:swarm_rover_system_client/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:swarm_rover_system_client/core/core.dart';
import 'package:swarm_rover_system_client/router/router.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  Future<void> onSubmit(WidgetRef ref) async {
    final authFormState = ref.read(authFormControllerProvider);

    ref.read(authFormControllerProvider.notifier).onSubmit();
    if (authFormState.email.isValid() && authFormState.password.isValid()) {
      await ref
          .read(authControllerProvider.notifier)
          .loginUsingEmailAndPassword(
            email: ref.read(authFormControllerProvider).email,
            password: ref.read(authFormControllerProvider).password,
          );

      if (ref.read(
            authControllerProvider.select((value) => value.successOrFailure),
          ) ==
          right<InfrastructureFailure, Unit>(unit)) {
        ref.read(authFormControllerProvider.notifier).reset();
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authFormState = ref.watch(authFormControllerProvider);
    final isLoading =
        ref.watch(authControllerProvider.select((value) => value.isLoading));

    return Form(
      autovalidateMode: authFormState.showErrors
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthTextFormField(
            isLoading: isLoading,
            initialValue: ref.read(authFormControllerProvider).email.value,
            isEmail: true,
            label: 'Email',
            validator: (_) => ref
                .read(authFormControllerProvider.select((value) => value.email))
                .validator(),
            onChanged:
                ref.read(authFormControllerProvider.notifier).updateEmail,
          ),
          const SizedBox(height: 16),
          AuthTextFormField(
            isLoading: isLoading,
            initialValue: ref.read(authFormControllerProvider).password.value,
            isPassword: true,
            label: 'Password',
            validator: (_) => ref
                .read(
                  authFormControllerProvider.select((value) => value.password),
                )
                .validator(),
            onChanged:
                ref.read(authFormControllerProvider.notifier).updatePassword,
          ),
          const SizedBox(height: 24),
          AuthButton(
            isLoading: isLoading,
            label: 'Login',
            onPressed: () => onSubmit(ref),
          ),
          const SizedBox(height: 8),
          AuthTextButton(
            label: 'Create Account',
            text: "Don't have an account? ",
            onPressed: () {
              const CreateAccountRoute().go(context);
            },
          ),
        ],
      ),
    );
  }
}
