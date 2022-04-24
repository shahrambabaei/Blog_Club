import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/widgets/login.dart';
import 'package:blog_club/widgets/shared/passwordformfield.dart';
import 'package:blog_club/widgets/signup.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late ThemeData _themeData;
  late TextStyle tabTextStyle;
  static const int tabLogin = 0;
  static const int tabSignUp = 1;
  int currentTab = tabLogin;

  @override
  void didChangeDependencies() {
    _themeData = Theme.of(context);
    tabTextStyle = TextStyle(
        color: _themeData.colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 32),
          child: Assets.images.icons.logo.svg(width: 132),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: _themeData.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            child: Column(children: [
              SizedBox(
                height: 60,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          currentTab = tabLogin;
                        });
                      },
                      child: Text(
                        'LOGIN',
                        style: tabTextStyle.apply(
                            color: currentTab == tabLogin
                                ? Colors.white
                                : Colors.white54),
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          currentTab = tabSignUp;
                        });
                      },
                      child: Text('SIGN UP',
                          style: tabTextStyle.apply(
                              color: currentTab == tabSignUp
                                  ? Colors.white
                                  : Colors.white54)))
                ]),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: _themeData.colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32, 45, 32, 8),
                      child: currentTab == tabLogin
                          ? Login(themeData: _themeData)
                          : SignUp(themeData: _themeData),
                    ),
                  ),
                ),
              )
            ]),
          ),
        )
      ]),
    ));
  }
}
