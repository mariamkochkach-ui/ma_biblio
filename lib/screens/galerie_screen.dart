
import 'package:flutter/material.dart';

import '../data/livres_data.dart';
import '../models/livre.dart';
import '../widgets/livre_grid_item.dart';
import '../widgets/livre_card.dart';
import 'detail_screen.dart';

class GalerieScreen extends StatefulWidget {
  const GalerieScreen({super.key});

  @override
  State<GalerieScreen> createState() => _GalerieScreenState();
}

class _GalerieScreenState extends State<GalerieScreen> {
  bool _affichageGrille = true;

  void _ouvrirDetail(Livre livre) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(livre: livre),
      ),
    ).then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void _trierParNote() {
    setState(() {
      livres.sort((a, b) => b.note.compareTo(a.note));
    });
  }

  @override
  Widget build(BuildContext context) {
    final largeur = MediaQuery.of(context).size.width;

    final int nombreColonnes;

    if (largeur < 600) {
      nombreColonnes = 2;
    } else if (largeur <= 900) {
      nombreColonnes = 3;
    } else {
      nombreColonnes = 4;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Galerie des livres'),
        actions: [
          // Basculer entre la grille et la liste
          IconButton(
            tooltip: _affichageGrille
                ? 'Afficher la liste'
                : 'Afficher la grille',
            icon: Icon(
              _affichageGrille
                  ? Icons.view_list
                  : Icons.grid_view,
            ),
            onPressed: () {
              setState(() {
                _affichageGrille = !_affichageGrille;
              });
            },
          ),

          // Trier par note décroissante
          IconButton(
            tooltip: 'Trier par note décroissante',
            icon: const Icon(Icons.sort),
            onPressed: _trierParNote,
          ),
        ],
      ),
      body: _affichageGrille
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: livres.length,

              // Q6.3 : largeur maximale de chaque case = 180 px
              // Le nombre de colonnes s'adapte à l'espace disponible.
              gridDelegate:
                  const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 180,
                childAspectRatio: 0.7,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),

              itemBuilder: (context, index) {
                final livre = livres[index];

                return LivreGridItem(
                  livre: livre,
                  onTap: () => _ouvrirDetail(livre),
                );
              },
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: livres.length,
              itemBuilder: (context, index) {
                final livre = livres[index];

                return LivreCard(
                  livre: livre,
                  onTap: () => _ouvrirDetail(livre),
                );
              },
            ),
    );
  }
}

