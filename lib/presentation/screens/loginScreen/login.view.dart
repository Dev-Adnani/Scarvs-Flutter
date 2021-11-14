import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/app/shared/dimensions.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSizedBox5,
            vSizedBox1,
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
              child: RichText(
                text: TextSpan(
                  text: 'Hey There ',
                  style: TextStyle(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                    fontWeight: FontWeight.w900,
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome ',
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                            fontWeight: FontWeight.w300,
                            fontSize: 34.0,
                          ),
                        ),
                        TextSpan(
                          text: 'To ',
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                            fontSize: 34.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: 'Scarvs ',
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                            fontSize: 34.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            vSizedBox2,
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Log In To ',
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                        TextSpan(
                          text: 'Your ',
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'Account Right Now ! ',
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            vSizedBox2,
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            controller: userEmailController,
                            validator: (val) =>
                                !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                        .hasMatch(val!)
                                    ? 'Enter an email'
                                    : null,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                color: AppColors.blueZodiac,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide:
                                    BorderSide(color: AppColors.rawSienna),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            controller: userPassController,
                            validator: (val) =>
                                val!.isEmpty ? 'Enter an password' : null,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                color: AppColors.blueZodiac,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide:
                                    BorderSide(color: AppColors.rawSienna),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  vSizedBox2,
                  Consumer<ThemeNotifier>(builder: (context, notifier, _) {
                    return MaterialButton(
                      height: MediaQuery.of(context).size.height * 0.05,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () async {
                        notifier.toggleTheme();
                      },
                      color: AppColors.rawSienna,
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            vSizedBox2,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not Having A Account? ",
                  style: TextStyle(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                    fontSize: 14.0,
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(AppRouter.signUpRoute),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
