import 'package:cinemagic/Theme.dart';
import 'package:flutter/material.dart';
import 'package:cinemagic/Screens/Tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "lib/.env");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) {
      runApp(
        ProviderScope(
          child: MaterialApp(
            theme: LightTheme,
            darkTheme: DarkTheme,
            home: tab(),
          ),
        ),
      );
    },
  );
}
