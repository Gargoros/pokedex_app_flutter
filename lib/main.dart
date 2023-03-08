import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_app.dart';

void main() async {
  runApp(
    const MyApp(),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}
