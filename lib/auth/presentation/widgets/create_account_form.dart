import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/auth/application/application.dart';
import 'package:swarm_rover_system_client/auth/presentation/widgets/auth_button.dart';
import 'package:swarm_rover_system_client/auth/presentation/widgets/auth_text_button.dart';
import 'package:swarm_rover_system_client/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:swarm_rover_system_client/router/router.dart';

class CreateAccountForm extends ConsumerWidget {
  const CreateAccountForm({super.key, required this.onSubmit});

  final void Function()? onSubmit;

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
            initialValue: ref
                .read(
                  authFormControllerProvider.select((value) => value.username),
                )
                .value,
            label: 'Username',
            validator: (_) => ref
                .read(
                  authFormControllerProvider.select((value) => value.username),
                )
                .validator(),
            onChanged:
                ref.read(authFormControllerProvider.notifier).updateUsername,
          ),
          const SizedBox(height: 16),
          AuthTextFormField(
            isLoading: isLoading,
            initialValue: ref
                .read(
                  authFormControllerProvider.select((value) => value.email),
                )
                .value,
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
            initialValue: ref
                .read(
                  authFormControllerProvider.select((value) => value.password),
                )
                .value,
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
            label: 'Create Account',
            onPressed: onSubmit,
          ),
          const SizedBox(height: 8),
          AuthTextButton(
            label: 'Login',
            text: 'Already have an account? ',
            onPressed: () {
              const LoginRoute().go(context);
            },
          ),
        ],
      ),
    );
  }
}
