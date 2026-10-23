
import 'package:flutter/material.dart';
import 'models/livre.dart';
import 'data/livres_data.dart';
import 'screens/parametres_screen.dart';
import 'screens/catalogue_screen.dart';
import 'widgets/livre_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaBiblio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaBiblio'),
        actions: [
          // Ouvrir le catalogue
          IconButton(
            icon: const Icon(Icons.library_books),
            tooltip: 'Catalogue',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CatalogueScreen(),
                ),
              );
            },
          ),

          // Ouvrir les paramètres
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Paramètres',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ParametresScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: livres.take(3).map(livreTile).toList(),
      ),
    );
  }
}
