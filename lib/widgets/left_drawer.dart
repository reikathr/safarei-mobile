import 'package:flutter/material.dart';
import 'package:safarei_mobile/screens/menu.dart';
import 'package:safarei_mobile/screens/safarei_form.dart';
import 'package:safarei_mobile/screens/safarei_animalpage.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Text(
                  'Safarei',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Archive your favorite animals here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white, // Set the text color to white
                  ),
                ),
              ],
            ),
          ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Tambah Item'),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SafareiFormPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.checklist),
              title: const Text('Lihat Item'),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SafareiAnimalPage()));
              },
            ),
        ],
      ),
    );
  }
}