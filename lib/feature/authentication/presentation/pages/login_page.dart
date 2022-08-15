import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:base_clean_architecture/generated/locale_keys.g.dart';
import 'package:base_clean_architecture/widget/c_text.dart';
import 'package:base_clean_architecture/widget/style/font_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CText(
          LocaleKeys.login.tr(),
          textColor: ColorsApp.color_000000,
        ),
      ),
    );
  }
}
