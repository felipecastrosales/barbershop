import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:barbershop/src/core/ui/barbershop_nav_global_key.dart';
import 'package:barbershop/src/core/ui/barbershop_theme.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:barbershop/src/features/auth/register/barbershop/barbershop_register_page.dart';
import 'package:barbershop/src/features/auth/register/user/user_register_page.dart';
import 'package:barbershop/src/features/employee/register/employee_register_page.dart';
import 'package:barbershop/src/features/employee/schedule/employee_schedule_page.dart';
import 'package:barbershop/src/features/home/adm/home_adm_page.dart';
import 'package:barbershop/src/features/home/employee/home_employee_page.dart';
import 'package:barbershop/src/features/schedule/schedule_page.dart';
import 'package:barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLoader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          navigatorObservers: [asyncNavigatorObserver],
          navigatorKey: BarbershopNavGlobalKey.instance.navKey,
          theme: BarbershopTheme.themeData,
          title: 'Barbershop',
          home: const SplashPage(),
          routes: {
            '/auth/login': (_) => const LoginPage(),
            '/auth/register/user': (_) => const UserRegisterPage(),
            '/auth/register/barbershop': (_) => const BarbershopRegisterPage(),
            '/home/adm': (_) => const HomeADMPage(),
            '/home/employee': (_) => const HomeEmployeePage(),
            '/employee/register': (_) => const EmployeeRegisterPage(),
            '/employee/schedule': (_) => const EmployeeSchedulePage(),
            '/schedule': (_) => const SchedulePage(),
          },
          locale: const Locale('pt', 'BR'),
          supportedLocales: const [Locale('pt', 'BR')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
