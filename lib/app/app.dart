import 'package:flutter/material.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_module_architecture/flutter_module_architecture.dart';
import 'package:learn_flutter/app/constants/brand.dart';
import 'package:learn_flutter/app/di/app_container.dart';
import 'package:learn_flutter/modules/abn/view/abn_screen.dart';

class LearnFlutterApp extends StatelessWidget {
  const LearnFlutterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterDesignApp(
        brand: CustomBrands(),
        materialApp: (localeResolutionCallback, localizationsDelegates,
            supportedLocales, locale, theme) {
          return FlutterModule.buildRootRouter(
              builder: (routerDelegate, routeInformationParser, context) {
                return MaterialApp.router(
                    theme: theme.copyWith(useMaterial3: true),
                    localizationsDelegates: localizationsDelegates,
                    routerDelegate: routerDelegate,
                    routeInformationParser: routeInformationParser);
              },
              rootPages: () async {
                AppPage rootAppPage = AppPage(
                    page: const MaterialPage(
                        key: ValueKey(""), child: AbnScreen()),
                    path: "");
                return [rootAppPage];
              },
              dependencyContainer: AppDependencyContainer(),
              onWillPop: (navigation) async {
                navigation.pop();
                return true;
              });
        });
  }
}
