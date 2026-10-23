
import 'package:flutter/material.dart';
import '../models/livre.dart';

class LivreGridItem extends StatelessWidget {
  final Livre livre;
  final VoidCallback onTap;

  const LivreGridItem({
    super.key,
    required this.livre,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: livre.couleur,
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.menu_book,
                      size: 45,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      livre.titre,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      livre.auteur,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          livre.note.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (livre.favori)
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 26,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
