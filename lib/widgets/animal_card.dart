import 'package:flutter/material.dart';

class Animal {
  String name;
  int amount;
  String family;
  String animalClass;
  String description;

  Animal(this.name, this.amount, this.family, this.animalClass, this.description);
}

class AnimalCard extends StatelessWidget {
  final Animal animal;

  const AnimalCard(this.animal, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(animal.name),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount: ${animal.amount}'),
                    Text('Family: ${animal.family}'),
                    Text('Class: ${animal.animalClass}'),
                    Text('Description: ${animal.description}'),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  animal.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.pink),
                ),
                Text(
                  'Amount: ${animal.amount}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  'Family: ${animal.family}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  'Class: ${animal.animalClass}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  animal.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}