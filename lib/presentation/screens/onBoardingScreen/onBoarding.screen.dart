import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scarvs/app/constants/app.assets.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/presentation/widgets/dimensions.dart';
import 'package:scarvs/core/models/onBoarding.model.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final List<OnBoardingModel> cards = [
    OnBoardingModel(
      image: AppAssets.onBoardingOne,
      title: 'Delivering Happiness',
      textColor: Colors.white,
      bgColor: AppColors.mirage,
    ),
    OnBoardingModel(
      image: AppAssets.onBoardingTwo,
      title: "Customer Support 24*7",
      bgColor: AppColors.creamColor,
      textColor: AppColors.mirage,
    ),
    OnBoardingModel(
      image: AppAssets.onBoardingThree,
      title: "Happily Serving Customer's World Wide Through Devices",
      bgColor: AppColors.rawSienna,
      textColor: Colors.white,
    ),
  ];

  List<Color> get colors => cards.map((p) => p.bgColor).toList();

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: widget.colors,
        radius: 30,
        itemCount: 3,
        curve: Curves.ease,
        duration: const Duration(seconds: 2),
        itemBuilder: (index, value) {
          OnBoardingModel card = widget.cards[index % widget.cards.length];
          return PageCard(card: card);
        },
        onFinish: () {
          Navigator.of(context).pushReplacementNamed(AppRouter.splashRoute);
        },
      ),
    );
  }
}

class PageCard extends StatelessWidget {
  final OnBoardingModel card;

  const PageCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        children: [
          hSizedBox4,
          _buildPicture(context),
          hSizedBox3,
          _buildText(context),
        ],
      ),
    );
  }

  Widget _buildPicture(
    BuildContext context, {
    double size = 380,
  }) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(
        top: 140,
      ),
      child: Lottie.asset(card.image!),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      card.title!,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: card.textColor,
        fontSize: 22,
      ),
    );
  }
}
