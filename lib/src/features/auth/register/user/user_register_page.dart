import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/features/auth/register/user/user_register_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class UserRegisterPage extends ConsumerStatefulWidget {
  const UserRegisterPage({super.key});

  @override
  ConsumerState<UserRegisterPage> createState() => _UserRegisterPageState();
}

final class _UserRegisterPageState extends ConsumerState<UserRegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userRegisterVM = ref.watch(userRegisterVMProvider.notifier);

    ref.listen(
      userRegisterVMProvider,
      (_, state) => switch (state) {
        UserRegisterStateStatus.initial => nil,
        UserRegisterStateStatus.success =>
          Navigator.of(context).pushNamed('/auth/register/barbershop'),
        UserRegisterStateStatus.error =>
          context.showError('Erro ao registrar usuário Administrador'),
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(30),
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(label: Text('Nome')),
              onTapOutside: (_) => context.unfocus(),
              validator: Validatorless.required('Nome obrigatório'),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(label: Text('E-mail')),
              onTapOutside: (_) => context.unfocus(),
              validator: Validatorless.multiple([
                Validatorless.required('E-mail obrigatório'),
                Validatorless.email('E-mail inválido'),
              ]),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(label: Text('Senha')),
              obscureText: true,
              onTapOutside: (_) => context.unfocus(),
              validator: Validatorless.multiple([
                Validatorless.required('Senha obrigatória'),
                Validatorless.min(6, 'Senha deve ter no mínimo 6 caracteres'),
              ]),
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: const InputDecoration(label: Text('Confirmar senha')),
              obscureText: true,
              onTapOutside: (_) => context.unfocus(),
              validator: Validatorless.multiple([
                Validatorless.required('Senha obrigatória'),
                Validatorless.compare(
                  passwordController,
                  'Senhas não conferem',
                ),
              ]),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => switch (formKey.currentState?.validate()) {
                null || false => context.showError('Formulário inválido'),
                true => userRegisterVM.register(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
              ),
              child: const Text('CRIAR CONTA'),
            ),
          ],
        ),
      ),
    );
  }
}
