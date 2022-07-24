import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/repository/pokemon_api.dart';
import 'package:pokemon_app/main.dart';
import 'package:pokemon_app/ui/home/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen._({super.key});

  static Widget create({Key? key}) => ChangeNotifierProvider(
        lazy: false,
        create: (context) => HomeProvider(
          pokemonApi: context.read<PokemonApi>(),
        )..loadPokemons(),
        child: HomeScreen._(key: key),
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final result = context.watch<HomeProvider>().pokemonList;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: result == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pokedex',
                          style: textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<ThemeProvider>().changeTheme();
                          },
                          icon: const Icon(
                            Icons.lightbulb,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('Search your pokemon ... '),
                    const SizedBox(height: 5),
                    TextField(
                      onChanged: (val) {
                        context.read<HomeProvider>().searchPokemon(val);
                        //Provider.of<HomeProvider>(context, listen:false).searchPokemon(val);
                      },
                      decoration: InputDecoration(
                        hintText: 'Name or Number',
                        fillColor: Colors.grey[100],
                        filled: true,
                        prefixIcon: const Icon(Icons.search),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Expanded(
                      child: PokemonGrid(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class PokemonGrid extends StatelessWidget {
  const PokemonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemons = context.watch<HomeProvider>().searchList;
    //final pokemons = Provider.of<HomeProvider>(context).searchList;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: pokemons?.length ?? 0,
      itemBuilder: (context, index) {
        final pokemon = pokemons![index];
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Image.network(
                pokemon.imageurl,
                height: 150,
              ),
              Text(
                pokemon.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                pokemon.id,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
