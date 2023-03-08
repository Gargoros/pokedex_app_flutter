import 'package:flutter/material.dart';
import 'package:pokemon_pokedex_app/constants/color_constants.dart';

import '../../constants/style_constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: redAppBar,
          minimumSize: const Size(double.infinity, 50)),
      child: Text(buttonText, style: customButtonStyle),
    );
  }
}
