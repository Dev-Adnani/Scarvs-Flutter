import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/app/shared/app.fonts.dart';
import 'package:scarvs/app/shared/dimensions.dart';
import 'package:scarvs/core/notifiers/authentication.notifer.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';
import 'package:scarvs/presentation/widgets/custom.animated.container.dart';
import 'package:scarvs/presentation/widgets/custom.text.field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    AuthenticationNotifier authNotifier(bool renderUI) =>
        Provider.of<AuthenticationNotifier>(context, listen: renderUI);

    _createAccount() {
      if (_formKey.currentState!.validate()) {
        authNotifier(false).createAccount(
            context: context,
            useremail: userEmailController.text,
            username: userNameController.text,
            userpassword: userPassController.text);
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSizedBox4,
            vSizedBox1,
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
              child: RichText(
                text: TextSpan(
                  text: 'Hey There 😲',
                  style: TextStyle(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                    fontWeight: FontWeight.w900,
                    fontFamily: AppFonts.contax,
                    fontSize: 35.0,
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
                          text: 'Welcome To ',
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                            fontFamily: AppFonts.contax,
                            fontSize: 28.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: 'Scarvs ! 🛒  ',
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                            fontFamily: AppFonts.contax,
                            fontSize: 28.0,
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
                          text: "Also Don't Worry ",
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                        TextSpan(
                          text: "We Don't Sell User Data",
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
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                              textEditingController: userNameController,
                              hintText: 'Enter User Name',
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter an Username' : null),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                            textEditingController: userEmailController,
                            hintText: 'Enter an email',
                            validator: (val) =>
                                !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                        .hasMatch(val!)
                                    ? 'Enter an email'
                                    : null,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                            onChanged: (val) {
                              authNotifier(false)
                                  .checkPasswordStrength(password: val);
                            },
                            textEditingController: userPassController,
                            hintText: 'Enter a Password',
                            validator: (val) =>
                                val!.isEmpty ? 'Enter a password' : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  vSizedBox1,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                    child: Row(
                      children: [
                        Text(authNotifier(true).passwordEmoji!),
                        hSizedBox1,
                        if (authNotifier(true).passwordLevel! == 'Weak')
                          CustomAnimatedContainer.customAnimatedContainer(
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.10,
                            context: context,
                            color: Colors.red,
                            curve: Curves.easeIn,
                          ),
                        if (authNotifier(true).passwordLevel! == 'Medium')
                          CustomAnimatedContainer.customAnimatedContainer(
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.40,
                            context: context,
                            color: Colors.blue,
                            curve: Curves.easeIn,
                          ),
                        if (authNotifier(true).passwordLevel! == 'Strong')
                          CustomAnimatedContainer.customAnimatedContainer(
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.70,
                            context: context,
                            color: Colors.green,
                            curve: Curves.easeIn,
                          ),
                      ],
                    ),
                  ),
                  vSizedBox2,
                  MaterialButton(
                    height: MediaQuery.of(context).size.height * 0.05,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () async {
                      _createAccount();
                    },
                    color: AppColors.rawSienna,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            vSizedBox2,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Having A Account? ",
                  style: TextStyle(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                    fontSize: 14.0,
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(AppRouter.loginRoute),
                  child: Text(
                    "Login now",
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
