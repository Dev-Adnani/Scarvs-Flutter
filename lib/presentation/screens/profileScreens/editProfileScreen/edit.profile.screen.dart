import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/core/notifiers/user.notifier.dart';
import 'package:scarvs/core/utils/snackbar.util.dart';
import 'package:scarvs/presentation/widgets/custom.back.btn.dart';
import 'package:scarvs/presentation/widgets/custom.text.field.dart';
import 'package:scarvs/presentation/widgets/custom.text.style.dart';
import 'package:scarvs/presentation/widgets/dimensions.widget.dart';

class EditProfileScreen extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    String patttern = r'(^(?:[+0]9)?[0-9]{10,15}$)';
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        body: Column(
          children: [
            Row(
              children: [
                CustomBackPop(themeFlag: themeFlag),
                Text(
                  'Edit Profile',
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
                      textEditingController: addressController,
                      hintText: 'Enter Address',
                      validator: (val) => val!.isEmpty ? 'Enter Address' : null,
                    ),
                    vSizedBox3,
                    CustomTextField.customTextField(
                      textEditingController: numberController,
                      hintText: 'Enter Phone No',
                      validator: (val) => !RegExp(patttern).hasMatch(val!)
                          ? 'Enter Phone No'
                          : null,
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
                              .updateUserDetails(
                                  userEmail: userNotifier.getUserEmail!,
                                  userAddress: addressController.text,
                                  userPhoneNo: numberController.text,
                                  context: context)
                              .then((value) {
                            if (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackUtil.stylishSnackBar(
                                  text: 'Info Updated',
                                  context: context,
                                ),
                              );
                              Navigator.of(context).pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackUtil.stylishSnackBar(
                                  text:
                                      'Error Please Try Again , After a While',
                                  context: context,
                                ),
                              );
                              Navigator.of(context).pop();
                            }
                          });
                        }
                      },
                      color: AppColors.rawSienna,
                      child: const Text(
                        'Update',
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
