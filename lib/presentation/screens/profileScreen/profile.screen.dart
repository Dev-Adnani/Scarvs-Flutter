import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/constants/app.keys.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/core/notifiers/user.notifier.dart';
import 'package:scarvs/presentation/widgets/custom.back.btn.dart';
import 'package:scarvs/presentation/widgets/custom.text.style.dart';
import 'package:scarvs/presentation/widgets/dimensions.widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        body: Column(
          children: [
            Row(
              children: [
                CustomBackButton(
                  route: AppRouter.homeRoute,
                  themeFlag: themeFlag,
                ),
                Text(
                  'Profile',
                  style: CustomTextWidget.bodyTextB2(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                ),
              ],
            ),
            vSizedBox1,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _createAccountInformation(
                    context: context,
                    themeFlag: themeFlag,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 18, 0, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Update Info',
                            style: TextStyle(
                              fontSize: 15,
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRouter.appSettingsRoute);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 18, 0, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 15,
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 18, 0, 0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        DeleteCache.deleteKey(AppKeys.userData)
                            .whenComplete(() {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRouter.loginRoute);
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.power_settings_new,
                            size: 20,
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Sign Out',
                            style: TextStyle(
                              fontSize: 15,
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAccountInformation({
    required BuildContext context,
    required bool themeFlag,
  }) {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    final double profilePictureSize = MediaQuery.of(context).size.width / 4;
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: profilePictureSize,
            height: profilePictureSize,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.accountInfo);
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: profilePictureSize,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: profilePictureSize - 4,
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
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userNotifier.getUserName!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Account Information',
                        style: TextStyle(
                          fontSize: 14,
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 20,
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
