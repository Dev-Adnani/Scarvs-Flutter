// ignore_for_file: avoid_print, recursive_getters

import 'dart:convert';
import 'dart:io';
import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.keys.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/core/api/authentication.api.dart';
import 'package:scarvs/core/utils/snackbar.util.dart';

class AuthenticationNotifier with ChangeNotifier {
  final AuthenticationAPI _authenticationAPI = AuthenticationAPI();

  String? _passwordLevel = "";
  String? get passwordLevel => _passwordLevel;

  String? _passwordEmoji = "";
  String? get passwordEmoji => _passwordEmoji;

  void checkPasswordStrength({required String password}) {
    String mediumPattern = r'^(?=.*?[!@#\$&*~]).{8,}';
    String strongPattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    if (password.contains(RegExp(strongPattern))) {
      _passwordEmoji = '🚀';
      _passwordLevel = 'Strong';
      notifyListeners();
    } else if (password.contains(RegExp(mediumPattern))) {
      _passwordEmoji = '🔥';
      _passwordLevel = 'Medium';
      notifyListeners();
    } else if (!password.contains(RegExp(strongPattern))) {
      _passwordEmoji = '😢';
      _passwordLevel = 'Weak';
      notifyListeners();
    }
  }

  Future createAccount(
      {required String useremail,
      required BuildContext context,
      required String username,
      required String userpassword}) async {
    try {
      var userData = await _authenticationAPI.createAccount(
          useremail: useremail, username: username, userpassword: userpassword);
      print(userData);

      final Map<String, dynamic> parseData = await jsonDecode(userData);
      bool isAuthenticated = parseData['authentication'];
      dynamic authData = parseData['data'];

      if (isAuthenticated) {
        WriteCache.setString(key: AppKeys.userData, value: authData)
            .whenComplete(
          () => Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackUtil.stylishSnackBar(text: authData, context: context));
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    } catch (e) {
      print(e);
    }
  }

  Future userLogin(
      {required String useremail,
      required BuildContext context,
      required String userpassword}) async {
    try {
      var userData = await _authenticationAPI.userLogin(
          useremail: useremail, userpassword: userpassword);
      print(userData);

      final Map<String, dynamic> parseData = await jsonDecode(userData);
      bool isAuthenticated = parseData['authentication'];
      dynamic authData = parseData['data'];

      if (isAuthenticated) {
        WriteCache.setString(key: AppKeys.userData, value: authData)
            .whenComplete(
          () => Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackUtil.stylishSnackBar(text: authData, context: context));
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    } catch (e) {
      print(e);
    }
  }
}
