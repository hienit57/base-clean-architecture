import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:metaway_holdings/core/environment/environment.dart';
import 'package:metaway_holdings/core/local/prefs_service.dart';
import 'package:metaway_holdings/injectors.dart';
import 'package:metaway_holdings/router/app_pages.dart';
import 'package:metaway_holdings/router/app_routes.dart';

void main() async {
  Environment().initEnv(EnvType.production);
  WidgetsFlutterBinding.ensureInitialized();

  mainApp();
}

Future<void> mainApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await PrefsService.init();
  // Init dependencies
  await initializeDependencies();
  final String token = await PrefsService.getToken();

  runApp(
    EasyLocalization(
      path: 'assets/localizations',
      supportedLocales: const [
        Locale('vi'),
        Locale('en'),
      ],
      startLocale: const Locale('vi'),
      fallbackLocale: const Locale('en'),
      child: MyApp(token: token),
    ),
  );
}

class MyApp extends StatefulWidget {
  final String? token;

  const MyApp({this.token, Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.focusedChild != null) {
          focus.focusedChild?.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Pindias',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routes: AppPages.getPages(context),
        onGenerateRoute: AppPages.generateRoute,
        initialRoute: (() {
          if ((widget.token ?? '').isNotEmpty) {
            //return AppRoutes.home;
          }
          final isViewOnBoarding = PrefsService.isViewOnBoarding();
          if (isViewOnBoarding) {
            return AppRoutes.login;
          }
          return AppRoutes.login;
        }()),
        builder: EasyLoading.init(),
        // home: PopupIntroductInstruction(),
      ),
    );
  }
}
