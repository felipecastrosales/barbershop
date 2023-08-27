import 'package:barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/core/ui/widgets/avatar_widget.dart';
import 'package:barbershop/src/core/ui/widgets/hours_panel.dart';
import 'package:barbershop/src/core/ui/widgets/weekdays_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class EmployeeRegisterPage extends ConsumerStatefulWidget {
  const EmployeeRegisterPage({super.key});

  @override
  ConsumerState<EmployeeRegisterPage> createState() =>
      _EmployeeRegisterPageState();
}

class _EmployeeRegisterPageState extends ConsumerState<EmployeeRegisterPage> {
  var registerAdm = false;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Colaborador'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  const AvatarWidget(),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Checkbox.adaptive(
                        value: registerAdm,
                        onChanged: (_) {
                          setState(() {
                            registerAdm = !registerAdm;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'Sou administrador e quero me cadastrar como colaborador',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Offstage(
                    offstage: registerAdm,
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        TextFormField(
                          onTapOutside: (_) => context.unfocus(),
                          controller: nameController,
                          validator: registerAdm
                              ? null
                              : Validatorless.required('Nome é obrigatório'),
                          decoration: const InputDecoration(
                            label: Text('Nome'),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          onTapOutside: (_) => context.unfocus(),
                          controller: emailController,
                          validator: registerAdm
                              ? null
                              : Validatorless.multiple([
                                  Validatorless.required(
                                    'E-mail é obrigatório',
                                  ),
                                  Validatorless.email(
                                    'Digite um e-mail válido',
                                  ),
                                ]),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            label: Text('Email'),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          onTapOutside: (_) => context.unfocus(),
                          obscureText: true,
                          controller: passwordController,
                          validator: registerAdm
                              ? null
                              : Validatorless.multiple([
                                  Validatorless.required('Senha é obrigatória'),
                                  Validatorless.min(
                                    6,
                                    'Senha deve conter no mínimo 6 caracteres',
                                  ),
                                ]),
                          decoration: const InputDecoration(
                            label: Text('Senha'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  WeekdaysPanel(
                    onDayPressed: (a) {},
                    // enableDays: openingDays,
                    // onDayPressed: employeeRegisterVm.addOrRemoveWorkdays,
                  ),
                  const SizedBox(height: 24),
                  HoursPanel(
                    startTime: 6,
                    endTime: 23,
                    onTimePressed: (a) {},
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(56),
                    ),
                    onPressed: () {
                      switch (formKey.currentState?.validate()) {
                        case false || null:
                          context.showError('Existem campos inválidos');
                        case true:
                        // final name = nameController.text;
                        // final email = emailController.text;
                        // final password = passwordController.text;
                        // employeeRegisterVm.register(
                        //   name: name,
                        //   email: email,
                        //   password: password,
                        // );
                      }
                    },
                    child: const Text('CADASTRAR COLABORADOR'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
