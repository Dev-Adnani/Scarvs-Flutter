import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/constants/app.keys.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/core/notifiers/user.notifier.dart';
import 'package:scarvs/core/utils/snackbar.util.dart';
import 'package:scarvs/presentation/widgets/custom.back.btn.dart';
import 'package:scarvs/presentation/widgets/custom.text.field.dart';
import 'package:scarvs/presentation/widgets/custom.text.style.dart';
import 'package:scarvs/presentation/widgets/dimensions.widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        body: Column(
          children: [
            Row(
              children: [
                CustomBackPop(themeFlag: themeFlag),
                Text(
                  'Change Password',
                  style: CustomTextWidget.bodyTextB2(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 45.0, 35.0, 2.0),
                child: Column(
                  children: [
                    CustomTextField.customTextField(
                      textEditingController: oldPassController,
                      hintText: 'Enter Old Password',
                      validator: (val) =>
                          val!.isEmpty ? 'Enter Old Password' : null,
                    ),
                    vSizedBox3,
                    CustomTextField.customTextField(
                      textEditingController: newPassController,
                      hintText: 'Enter New Password',
                      validator: (val) =>
                          val!.isEmpty ? 'Enter New Password' : null,
                    ),
                    vSizedBox3,
                    MaterialButton(
                      height: MediaQuery.of(context).size.height * 0.05,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          userNotifier
                              .changePassword(
                                  userEmail: userNotifier.getUserEmail!,
                                  oluserpassword: oldPassController.text,
                                  newuserpassword: newPassController.text,
                                  context: context)
                              .then((value) {
                            if (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackUtil.stylishSnackBar(
                                    text:
                                        'Password Changed , Please Login Again',
                                    context: context),
                              );
                              DeleteCache.deleteKey(AppKeys.userData)
                                  .whenComplete(() {
                                Navigator.of(context)
                                    .pushReplacementNamed(AppRouter.loginRoute);
                              });
                            }
                            if (!value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackUtil.stylishSnackBar(
                                    text: 'Ehh Wrong Pass', context: context),
                              );
                            }
                          });
                        }
                      },
                      color: AppColors.rawSienna,
                      child: const Text(
                        'Change',
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
            )
          ],
        ),
      ),
    );
  }
}
