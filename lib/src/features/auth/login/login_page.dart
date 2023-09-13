import 'package:barbershop/src/core/constants/constants.dart';
import 'package:barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/features/auth/login/login_state.dart';
import 'package:barbershop/src/features/auth/login/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

final class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

final class _LoginPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginVM(:login) = ref.watch(loginVMProvider.notifier);

    ref.listen(
      loginVMProvider,
      (_, state) {
        debugPrint('state: ${state.status}');
        switch (state) {
          case LoginState(status: LoginStateStatus.initial):
            break;
          case LoginState(status: LoginStateStatus.error, :final errorMessage?):
            context.showError(errorMessage);
          case LoginState(status: LoginStateStatus.error):
            context.showError('Erro ao realizar login');
          case LoginState(status: LoginStateStatus.admLogin):
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home/adm', (_) => false);
          case LoginState(status: LoginStateStatus.employeeLogin):
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home/employee', (_) => false);
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundChair),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.imgLogo,
                            width: 150,
                            height: 170,
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: emailController,
                            onTapOutside: (_) => context.unfocus(),
                            keyboardType: TextInputType.emailAddress,
                            validator: Validatorless.multiple([
                              Validatorless.required('E-mail obrigatório'),
                              Validatorless.email('E-mail inválido'),
                            ]),
                            decoration: const InputDecoration(
                              label: Text('E-mail'),
                              labelStyle: TextStyle(color: Colors.black),
                              hintText: 'E-mail',
                              hintStyle: TextStyle(color: Colors.black),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: passwordController,
                            onTapOutside: (_) => context.unfocus(),
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigatória'),
                              Validatorless.min(6, 'Senha inválida'),
                            ]),
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text('Senha'),
                              labelStyle: TextStyle(color: Colors.black),
                              hintText: 'Senha',
                              hintStyle: TextStyle(color: Colors.black),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: AppColors.brown,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () =>
                                switch (formKey.currentState?.validate()) {
                              (false || null) =>
                                context.showError('Campos inválidos'),
                              true => login(
                                  emailController.text,
                                  passwordController.text,
                                ),
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(56),
                            ),
                            child: const Text('ACESSAR'),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () => Navigator.of(context).pushNamed(
                            '/auth/register/user',
                          ),
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
