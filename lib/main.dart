import 'package:flutter/material.dart';
import 'package:pokemon_app/data/pokemon_analytics.dart';
import 'package:pokemon_app/data/rest/pokemon_rest_service.dart';
import 'package:pokemon_app/domain/repository/pokemon_api.dart';
import 'package:pokemon_app/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PokemonAnalytics>(
          create: (_) => PokemonAnalytics(),
        ),
        Provider<PokemonApi>(
          create: (context) => PokemonRestService(
            context.read<PokemonAnalytics>(),
            // context.read<PokemonAnalytics>(),
            // context.read<PokemonAnalytics>(),
            // context.read<PokemonAnalytics>(),
            // context.read<PokemonAnalytics>(),
          ),
        ),
        // ProxyProvider2<PokemonAnalytics, PokemonAnalytics2, PokemonApi>(
        //   update: (_, analytics, analytics, __) =>
        //       PokemonRestService(analytics, analytics2),
        // ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (context, provider, _) {
        final isLight = provider.isLight;
        return MaterialApp(
          title: 'Flutter Pokemon',
          theme: isLight ? ThemeData.light() : ThemeData.dark(),
          home: const SplashScreen(),
        );
      }),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  bool isLight = true;

  void changeTheme() {
    isLight = !isLight;
    notifyListeners();
  }
}
