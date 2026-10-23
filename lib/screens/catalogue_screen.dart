
import 'package:flutter/material.dart';
import '../data/livres_data.dart';
import '../widgets/livre_card.dart';
import 'detail_screen.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nouveautes =
        livres.where((livre) => livre.nouveaute).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('MaBiblio - Catalogue'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Nouveautés',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Liste horizontale des nouveautés
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: nouveautes.map((livre) {
                return Container(
                  width: 110,
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: livre.couleur,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    livre.titre,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Tout le catalogue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Q4.4 : ListView.builder avec LivreCard.
          // Les marges des cartes remplacent les séparateurs.
          Expanded(
            child: ListView.builder(
              itemCount: livres.length,
              itemBuilder: (context, index) {
                final livre = livres[index];

                return LivreCard(
                  livre: livre,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          livre: livre,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
