import 'package:barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/core/ui/widgets/avatar_widget.dart';
import 'package:barbershop/src/core/ui/widgets/hours_panel.dart';
import 'package:barbershop/src/features/schedule/schedule_state.dart';
import 'package:barbershop/src/features/schedule/schedule_vm.dart';
import 'package:barbershop/src/features/schedule/widgets/schedule_calendar.dart';
import 'package:barbershop/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

class SchedulePage extends ConsumerStatefulWidget {
  const SchedulePage({super.key});

  @override
  ConsumerState<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends ConsumerState<SchedulePage> {
  var dateFormat = DateFormat('dd/MM/yyyy');
  var showCalendar = false;

  final formKey = GlobalKey<FormState>();
  final clientController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    clientController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = ModalRoute.of(context)?.settings.arguments as UserModel;
    final scheduleVM = ref.watch(scheduleVMProvider.notifier);

    final employeeData = switch (userModel) {
      UserModelADM(:final workDays, :final workHours) => (
          workDays: workDays!,
          workHours: workHours!,
        ),
      UserModelEmployee(:final workDays, :final workHours) => (
          workDays: workDays,
          workHours: workHours,
        ),
    };

    ref.listen(
      scheduleVMProvider.select((state) => state.status),
      (_, status) {
        switch (status) {
          case ScheduleStateStatus.initial:
            break;
          case ScheduleStateStatus.success:
            context.showSuccess('Cliente agendado com sucesso');
            Navigator.of(context).pop();
          case ScheduleStateStatus.error:
            context.showError('Erro ao registrar agendamento');
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Cliente'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  const AvatarWidget.withoutButton(),
                  const SizedBox(height: 32),
                  Text(
                    userModel.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: clientController,
                    validator: Validatorless.required('Nome é obrigatório'),
                    onTapOutside: (_) => context.unfocus(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome do Cliente',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: dateController,
                    validator: Validatorless.required('Data é obrigatório'),
                    readOnly: true,
                    onTap: () {
                      setState(() {
                        showCalendar = true;
                      });
                      context.unfocus();
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Selecione uma data',
                      hintText: 'Selecione uma data',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Offstage(
                    offstage: !showCalendar,
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        ScheduleCalendar(
                          workDays: const ['seg', 'qua', 'qui'],
                          cancelPressed: () {
                            setState(() {
                              showCalendar = false;
                            });
                          },
                          onOkPressed: (DateTime value) {
                            setState(() {
                              dateController.text = dateFormat.format(value);
                              scheduleVM.dateSelect(value);
                              showCalendar = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  HoursPanel.singleSelection(
                    startTime: 6,
                    endTime: 23,
                    onTimePressed: scheduleVM.timeSelect,
                    enabledTimes: employeeData.workHours,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(56),
                    ),
                    onPressed: () {
                      switch (formKey.currentState?.validate()) {
                        case null || false:
                          context.showError('Dados incompletos');
                        case true:
                          final hasHourSelected = ref.watch(
                            scheduleVMProvider
                                .select((state) => state.scheduleTime != null),
                          );
                          if (hasHourSelected) {
                            scheduleVM.register(
                              user: userModel,
                              clientName: clientController.text,
                            );
                          } else {
                            context.showError(
                              'Selecione um horário de atendimento',
                            );
                          }
                      }
                    },
                    child: const Text('AGENDAR'),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
