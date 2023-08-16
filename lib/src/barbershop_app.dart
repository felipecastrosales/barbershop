import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLoader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          navigatorObservers: [asyncNavigatorObserver],
          title: 'Barbershop',
          routes: {
            '/': (context) => const SplashPage(),
            '/barbers': (context) => const BarbersPage(),
            '/barbers/:id': (context) => const BarberPage(),
          },
        );
      },
    );
  }
}

class BarbersPage extends StatelessWidget {
  const BarbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Barbers Page'),
      ),
    );
  }
}

class BarberPage extends StatelessWidget {
  const BarberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Barber Page'),
      ),
    );
  }
}
