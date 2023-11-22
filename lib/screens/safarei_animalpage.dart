import 'package:flutter/material.dart';
import 'package:safarei_mobile/widgets/left_drawer.dart';
import 'package:safarei_mobile/screens/safarei_form.dart';
import 'package:safarei_mobile/widgets/animal_card.dart';

class SafareiAnimalPage extends StatelessWidget {
  const SafareiAnimalPage({super.key});

  @override
    Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Safarei',
          style: TextStyle(
            color: Colors.white,
          )
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Look at your favorite animals!', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: animals.map((Animalz animal) {
                  // Iterasi untuk setiap item
                  return AnimalzCard(animal);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
