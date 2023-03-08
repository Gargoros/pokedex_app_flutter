import 'package:flutter/material.dart';

import '../../../constants/text_constants.dart';

class PokedexAppBarImageBox extends StatelessWidget {
  const PokedexAppBarImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            pokemonAppBarImage,
            fit: BoxFit.contain,
            height: 80,
          ),
        ],
      ),
    );
  }
}
