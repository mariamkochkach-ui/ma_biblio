
import 'package:flutter/material.dart';

class ParametresScreen extends StatelessWidget {
  const ParametresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Mon profil'),
              subtitle: const Text('Nom, e-mail, mot de passe'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profil sélectionné'),
                  ),
                );
              },
            ),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              trailing: Icon(Icons.chevron_right),
              tileColor: Color(0xFFE3F2FD),
              iconColor: Colors.blue,
              textColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Langue'),
              subtitle: Text('Français'),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              subtitle: const Text(
                'Version de l’application\nMaBiblio',
              ),
              trailing: const Icon(Icons.chevron_right),

              // dense: true : réduit la hauteur de la ligne.
              // isThreeLine: true : réserve la place pour trois lignes.
              // enabled: false : désactive la ligne et la grise.
              isThreeLine: true,
            ),
          ],
        ).toList(),
      ),
    );
  }
}
