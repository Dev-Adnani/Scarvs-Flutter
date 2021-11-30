import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/presentation/screens/AuthenticationScreens/loginScreen/widget/welcome.login.widget.dart';
import 'package:scarvs/presentation/widgets/dimensions.widget.dart';
import 'package:scarvs/core/notifiers/authentication.notifer.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';
import 'package:scarvs/presentation/widgets/custom.text.field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _userLogin() {
      if (_formKey.currentState!.validate()) {
        var authNotifier =
            Provider.of<AuthenticationNotifier>(context, listen: false);
        authNotifier.userLogin(
            context: context,
            useremail: userEmailController.text,
            userpassword: userPassController.text);
      }
    }

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
            welcomeTextLogin(themeFlag: themeFlag),
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
                              const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
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
                        vSizedBox1,
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                            textEditingController: userPassController,
                            hintText: 'Enter a password',
                            validator: (val) =>
                                val!.isEmpty ? 'Enter a password' : null,
                          ),
                        )
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
                      _userLogin();
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
                  )
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
