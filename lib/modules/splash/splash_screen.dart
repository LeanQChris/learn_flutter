import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_module_architecture/flutter_module_architecture.dart';
import 'package:learn_flutter/modules/page/view/page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      context.navigationCubit.root(
          AppPage(page: const MaterialPage(child: PageScreen()), path: "page"));
    });
    return const Scaffold();
  }
}
