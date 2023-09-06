import 'dart:developer';

import 'package:barbershop/src/core/constants.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/core/ui/barbershop_icons.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/home/adm/home_adm_state.dart';
import 'package:barbershop/src/features/home/adm/home_adm_vm.dart';
import 'package:barbershop/src/features/home/adm/widgets/home_employee_tile.dart';
import 'package:barbershop/src/features/home/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeADMPage extends ConsumerWidget {
  const HomeADMPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeADMVMProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/employee/register');
          ref.invalidate(getMeProvider);
          ref.invalidate(homeADMVMProvider);
        },
        shape: const CircleBorder(),
        backgroundColor: ColorConstants.brown,
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 12,
          child: Icon(
            BarbershopIcons.addEmployee,
            color: ColorConstants.brown,
          ),
        ),
      ),
      body: homeState.when(
        loading: () => const BarbershopLoader(),
        error: (e, s) {
          log('UI Erro ao buscar colaboradores', error: e, stackTrace: s);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Erro ao carregar página.',
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(homeADMVMProvider.notifier).logout();
                  },
                  child: const Text('Deslogar'),
                ),
              ],
            ),
          );
        },
        data: (HomeADMState data) => CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: HomeHeader(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: data.employees.length,
                (context, index) => HomeEmployeeTile(
                  employee: data.employees[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
