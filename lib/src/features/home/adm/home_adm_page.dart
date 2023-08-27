import 'package:barbershop/src/core/constants.dart';
import 'package:barbershop/src/core/ui/barbershop_icons.dart';
import 'package:barbershop/src/features/home/adm/widgets/home_employee_tile.dart';
import 'package:barbershop/src/features/home/widgets/home_header.dart';
import 'package:barbershop/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeADMPage extends ConsumerStatefulWidget {
  const HomeADMPage({super.key});

  @override
  ConsumerState<HomeADMPage> createState() => _HomeADMPageState();
}

class _HomeADMPageState extends ConsumerState<HomeADMPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HomeHeader(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => HomeEmployeeTile(
                employee: UserModelADM(
                  id: 7,
                  name: 'Felipe Sales',
                  email: 'soufeliposales@gmail.com',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// {email: felipe@gmail.com, password: 123456}