import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/widgets/passwordformfield.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({ Key? key,required this.themeData }) : super(key: key);
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome back',
                                style: themeData.textTheme.headline4),
                            const Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 16),
                              child: Text(
                                'Sign wth your account',
                              ),
                            ),
                            const TextField(
                                decoration: InputDecoration(
                              labelText: 'Username',
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            const PasswordFormField(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 28, bottom: 10),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('LOGIN',
                                    style:
                                        themeData.textTheme.headline4!.apply(
                                      color: Colors.white,
                                      fontSizeFactor: .8,
                                    )),
                                style: ElevatedButton.styleFrom(
                                    enableFeedback: false,
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width, 60),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Forgot your password?'),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text('Reset here'))
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 16),
                              child: Center(
                                child: Text(
                                  'OR SIGN IN WITH',
                                  style: TextStyle(wordSpacing: 2),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.images.icons.google
                                    .image(width: 32, height: 32),
                                const SizedBox(width: 25),
                                Assets.images.icons.facebook
                                    .image(width: 32, height: 32),
                                const SizedBox(width: 25),
                                Assets.images.icons.twitter
                                    .image(width: 32, height: 32)
                              ],
                            )
                          ]);
  }
}