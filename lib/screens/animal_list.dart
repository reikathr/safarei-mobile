import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:safarei_mobile/models/animals.dart';
import 'package:safarei_mobile/screens/animal_details.dart';
import 'package:safarei_mobile/widgets/left_drawer.dart';

class AnimalListPage extends StatefulWidget {
    const AnimalListPage({Key? key}) : super(key: key);

    @override
    _AnimalListPageState createState() => _AnimalListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {
Future<List<Animal>> fetchAnimal() async {
    var url = Uri.parse(
        'https://athira-reika-tugas.pbp.cs.ui.ac.id/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Animal
    List<Animal> list_animal = [];
    for (var d in data) {
        if (d != null) {
            list_animal.add(Animal.fromJson(d));
        }
    }
    return list_animal;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Animal'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchAnimal(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data binatang.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => InkWell (
                          onTap: () {
                            final animal = snapshot.data![index];
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AnimalDetails(animal: animal)),
                            );
                          },
                          child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    // const SizedBox(height: 10),
                                    // Text("${snapshot.data![index].fields.family}"),
                                    // const SizedBox(height: 10),
                                    // Text("${snapshot.data![index].fields.animalClass}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            )));
                    }
                }
            }));
    }
}
