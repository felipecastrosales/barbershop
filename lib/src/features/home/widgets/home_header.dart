import 'package:barbershop/src/core/constants/constants.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/core/ui/barbershop_icons.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/home/adm/home_adm_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key}) : hideFilter = true;
  const HomeHeader.withoutFilter({super.key}) : hideFilter = false;

  final bool hideFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final barberShop = ref.watch(getMyBarbershopProvider);

    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          opacity: 0.5,
          image: AssetImage(
            AppImages.backgroundChair,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.maybeViewPaddingOf(context)?.top),
          barberShop.maybeWhen(
            orElse: () => const Center(
              child: BarbershopLoader(),
            ),
            data: (barbershop) => Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xffbdbdbd),
                  child: SizedBox.shrink(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    barbershop.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  'Editar',
                  style: TextStyle(
                    color: AppColors.brown,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    ref.read(homeADMVMProvider.notifier).logout();
                  },
                  icon: const Icon(
                    BarbershopIcons.exit,
                    color: AppColors.brown,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Bem-vindo',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Agende um Cliente',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 40,
            ),
          ),
          Offstage(
            offstage: hideFilter,
            child: const SizedBox(height: 24),
          ),
          Offstage(
            offstage: hideFilter,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Buscar colaborador',
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Icon(
                    BarbershopIcons.search,
                    color: AppColors.brown,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
