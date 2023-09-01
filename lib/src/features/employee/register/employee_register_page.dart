import 'dart:developer';

import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/core/ui/widgets/avatar_widget.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/core/ui/widgets/hours_panel.dart';
import 'package:barbershop/src/core/ui/widgets/weekdays_panel.dart';
import 'package:barbershop/src/features/employee/register/employee_register_state.dart';
import 'package:barbershop/src/features/employee/register/employee_register_vm.dart';
import 'package:barbershop/src/models/barbershop_model.dart';
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
  var registerADM = false;
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
    final employeeRegisterVM = ref.watch(employeeRegisterVMProvider.notifier);
    final barbershopAsyncValue = ref.watch(getMyBarbershopProvider);

    ref.listen(
      employeeRegisterVMProvider.select((state) => state.status),
      (_, status) {
        switch (status) {
          case EmployeeRegisterStateStatus.initial:
            break;
          case EmployeeRegisterStateStatus.success:
            context.showSuccess('Colaborador registrado com sucesso');
            Navigator.of(context).pop();
          case EmployeeRegisterStateStatus.error:
            context.showError('Erro ao registar colaborador');
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Colaborador'),
      ),
      body: barbershopAsyncValue.when(
        loading: () => const BarbershopLoader(),
        error: (e, s) {
          log('Erro ao carregar a página', error: e, stackTrace: s);
          return const Center(
            child: Text('Erro ao carregar a página'),
          );
        },
        data: (barbershop) {
          final BarbershopModel(:openDays, :openHours) = barbershop;

          return SingleChildScrollView(
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
                            value: registerADM,
                            onChanged: (_) {
                              setState(() {
                                registerADM = !registerADM;
                              });
                              employeeRegisterVM.setRegisterADM(registerADM);
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
                        offstage: registerADM,
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            TextFormField(
                              onTapOutside: (_) => context.unfocus(),
                              controller: nameController,
                              decoration: const InputDecoration(
                                label: Text('Nome'),
                              ),
                              validator: registerADM
                                  ? null
                                  : Validatorless.required(
                                      'Nome é obrigatório',
                                    ),
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              onTapOutside: (_) => context.unfocus(),
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                label: Text('Email'),
                              ),
                              validator: registerADM
                                  ? null
                                  : Validatorless.multiple([
                                      Validatorless.required(
                                        'E-mail é obrigatório',
                                      ),
                                      Validatorless.email(
                                        'Digite um e-mail válido',
                                      ),
                                    ]),
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              onTapOutside: (_) => context.unfocus(),
                              obscureText: true,
                              controller: passwordController,
                              decoration: const InputDecoration(
                                label: Text('Senha'),
                              ),
                              validator: registerADM
                                  ? null
                                  : Validatorless.multiple([
                                      Validatorless.required(
                                        'Senha é obrigatória',
                                      ),
                                      Validatorless.min(
                                        6,
                                        'Senha deve conter no mínimo 6 caracteres',
                                      ),
                                    ]),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      WeekdaysPanel(
                        enabledDays: openDays,
                        onDayPressed: employeeRegisterVM.addOrRemoveWeekDays,
                      ),
                      const SizedBox(height: 24),
                      HoursPanel(
                        startTime: 6,
                        endTime: 23,
                        enabledTimes: openHours,
                        onTimePressed: employeeRegisterVM.addOrRemoveWorkHours,
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
                              // final EmployeeRegisterState(
                              //   :workDays,
                              //   :workHours
                              // ) = ref.watch(employeeRegisterVMProvider);

                              // if (workDays.isEmpty || workHours.isEmpty) {
                              //   context.showError(
                              //     'Selecione os dias da semana e horário de atendimento',
                              //   );
                              //   return;
                              // }

                              // employeeRegisterVM.register(
                              //   name: nameController.text,
                              //   email: emailController.text,
                              //   password: passwordController.text,
                              // );

                              final EmployeeRegisterState(
                                workDays: List(isEmpty: hasWorkDays),
                                workHours: List(isEmpty: hasWorkHours),
                              ) = ref.watch(employeeRegisterVMProvider);

                              if (hasWorkDays || hasWorkHours) {
                                context.showError(
                                  'Selecione os dias da semana e horário de atendimento',
                                );
                                return;
                              }

                              employeeRegisterVM.register(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                          }
                        },
                        child: const Text('CADASTRAR COLABORADOR'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
