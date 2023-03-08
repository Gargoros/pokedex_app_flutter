import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokemon_pokedex_app/constants/color_constants.dart';
import 'package:pokemon_pokedex_app/constants/text_constants.dart';
import 'package:pokemon_pokedex_app/features/home_screen/screens/pokedex_home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  void navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, PokedexHomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(landingImage), fit: BoxFit.cover)),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              LimitedBox(
                maxHeight: 150,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(landingImageText),
                          fit: BoxFit.scaleDown)),
                ),
              ),
              LimitedBox(
                child: LinearPercentIndicator(
                  barRadius: const Radius.circular(20),
                  width: MediaQuery.of(context).size.width,
                  animation: true,
                  lineHeight: 14.0,
                  animationDuration: 2500,
                  percent: 1,
                  progressColor: redAppBar,
                  backgroundColor: dragonColor,
                  onAnimationEnd: () => navigateToHomeScreen(context),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ]),
          )),
    );
  }
}
