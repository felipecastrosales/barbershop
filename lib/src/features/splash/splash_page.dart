import 'dart:developer';

import 'package:barbershop/src/core/constants.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:barbershop/src/features/splash/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

final class _SplashPageState extends ConsumerState<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 150 * _scale;
  double get _logoAnimationHeight => 170 * _scale;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashVMProvider, (_, state) {
      state.whenOrNull(
        error: (e, s) {
          log('Erro ao validar login', error: e, stackTrace: s);
          context.showError('Erro ao validar login');
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/auth/login', (_) => false);
        },
        data: (data) => switch (data) {
          SplashState.loggedADM => Navigator.of(context)
              .pushNamedAndRemoveUntil('/home/adm', (_) => false),
          SplashState.loggedEmployee => Navigator.of(context)
              .pushNamedAndRemoveUntil('/home/employee', (_) => false),
          _ => Navigator.of(context)
              .pushNamedAndRemoveUntil('/home/login', (_) => false),
        },
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstants.backgroundChair),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _animationOpacityLogo,
            curve: Curves.easeIn,
            duration: const Duration(seconds: 3),
            onEnd: () => Navigator.of(context).pushAndRemoveUntil<void>(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const LoginPage(),
                transitionsBuilder: (_, animation, __, child) =>
                    FadeTransition(opacity: animation, child: child),
              ),
              (_) => false,
            ),
            child: AnimatedContainer(
              width: _logoAnimationWidth,
              height: _logoAnimationHeight,
              curve: Curves.linearToEaseOut,
              duration: const Duration(seconds: 3),
              child: Image.asset(
                ImageConstants.imgLogo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
