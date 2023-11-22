import 'dart:convert';

List<Animal> animalFromJson(String str) => List<Animal>.from(json.decode(str).map((x) => Animal.fromJson(x)));

String animalToJson(List<Animal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Animal {
    String model;
    int pk;
    Fields fields;

    Animal({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int amount;
    String family;
    String animalClass;
    String description;
    String animalImage;

    Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.family,
        required this.animalClass,
        required this.description,
        required this.animalImage,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        family: json["family"],
        animalClass: json["animal_class"],
        description: json["description"],
        animalImage: json["animal_image"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "family": family,
        "animal_class": animalClass,
        "description": description,
        "animal_image": animalImage,
    };
}
