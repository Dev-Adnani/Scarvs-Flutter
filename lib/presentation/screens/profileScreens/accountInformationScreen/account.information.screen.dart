import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/core/notifiers/user.notifier.dart';
import 'package:scarvs/presentation/widgets/custom.back.btn.dart';
import 'package:scarvs/presentation/widgets/custom.text.style.dart';

class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    final double profilePictureSize = MediaQuery.of(context).size.width / 3;
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        body: Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SingleChildScrollView(
            child: Consumer<UserNotifier>(
              builder: (context, notifier, _) {
                return FutureBuilder(
                  future: notifier.getUserDetails(
                      userEmail: userNotifier.userEmail!, context: context),
                  builder: (context, snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomBackPop(themeFlag: themeFlag),
                            Text(
                              'User Profile',
                              style: CustomTextWidget.bodyTextB2(
                                color: themeFlag
                                    ? AppColors.creamColor
                                    : AppColors.mirage,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(top: 40),
                            width: profilePictureSize,
                            height: profilePictureSize,
                            child: CircleAvatar(
                              backgroundColor: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                              radius: (profilePictureSize),
                              child: Hero(
                                tag: 'profilePicture',
                                child: ClipOval(
                                  child: SvgPicture.network(
                                    'https://avatars.dicebear.com/api/big-smile/${userNotifier.getUserName!}.svg',
                                    semanticsLabel: 'A shark?!',
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Name',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          notifier.getUserName!,
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Email',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          notifier.getUserEmail!,
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Address ',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          notifier.getuserAddress,
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Phone ',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          notifier.getuserPhoneNumber,
                          style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
