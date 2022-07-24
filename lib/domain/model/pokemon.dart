// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

List<Pokemon> pokemonFromJson(String str) =>
    List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));

String pokemonToJson(List<Pokemon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pokemon {
  Pokemon({
    required this.name,
    required this.id,
    required this.imageurl,
    required this.xdescription,
    required this.ydescription,
    required this.height,
    required this.category,
    required this.weight,
    required this.evolutions,
    required this.abilities,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.total,
    required this.genderless,
    required this.eggGroups,
    required this.evolvedfrom,
    required this.reason,
    required this.baseExp,
  });

  final String name;
  final String id;
  final String imageurl;
  final String xdescription;
  final String ydescription;
  final String height;
  final String category;
  final String weight;
  final List<String> evolutions;
  final List<String> abilities;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final int total;
  final int genderless;
  final String eggGroups;
  final String evolvedfrom;
  final String reason;
  final String baseExp;

  Pokemon copyWith({
    String? name,
    String? id,
    String? imageurl,
    String? xdescription,
    String? ydescription,
    String? height,
    String? category,
    String? weight,
    List<String>? evolutions,
    List<String>? abilities,
    int? hp,
    int? attack,
    int? defense,
    int? specialAttack,
    int? specialDefense,
    int? speed,
    int? total,
    int? genderless,
    String? eggGroups,
    String? evolvedfrom,
    String? reason,
    String? baseExp,
  }) {
    return Pokemon(
      name: name ?? this.name,
      id: id ?? this.id,
      imageurl: imageurl ?? this.imageurl,
      xdescription: xdescription ?? this.xdescription,
      ydescription: ydescription ?? this.ydescription,
      height: height ?? this.height,
      category: category ?? this.category,
      weight: weight ?? this.weight,
      evolutions: evolutions ?? this.evolutions,
      abilities: abilities ?? this.abilities,
      hp: hp ?? this.hp,
      attack: attack ?? this.attack,
      defense: defense ?? this.defense,
      specialAttack: specialAttack ?? this.specialAttack,
      specialDefense: specialDefense ?? this.specialDefense,
      speed: speed ?? this.speed,
      total: total ?? this.total,
      genderless: genderless ?? this.genderless,
      eggGroups: eggGroups ?? this.eggGroups,
      evolvedfrom: evolvedfrom ?? this.evolvedfrom,
      reason: reason ?? this.reason,
      baseExp: baseExp ?? this.baseExp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'imageurl': imageurl,
      'xdescription': xdescription,
      'ydescription': ydescription,
      'height': height,
      'category': category,
      'weight': weight,
      'evolutions': evolutions,
      'abilities': abilities,
      'hp': hp,
      'attack': attack,
      'defense': defense,
      'specialAttack': specialAttack,
      'specialDefense': specialDefense,
      'speed': speed,
      'total': total,
      'genderless': genderless,
      'eggGroups': eggGroups,
      'evolvedfrom': evolvedfrom,
      'reason': reason,
      'baseExp': baseExp,
    };
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        id: json["id"],
        imageurl: json["imageurl"],
        xdescription: json["xdescription"],
        ydescription: json["ydescription"],
        height: json["height"],
        category: json["category"],
        weight: json["weight"],
        evolutions: List<String>.from(json["evolutions"].map((x) => x)),
        abilities: List<String>.from(json["abilities"].map((x) => x)),
        hp: json["hp"],
        attack: json["attack"],
        defense: json["defense"],
        specialAttack: json["special_attack"],
        specialDefense: json["special_defense"],
        speed: json["speed"],
        total: json["total"],
        genderless: json["genderless"],
        eggGroups: json["egg_groups"],
        evolvedfrom: json["evolvedfrom"],
        reason: json["reason"],
        baseExp: json["base_exp"],
      );

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(covariant Pokemon other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.imageurl == imageurl &&
        other.xdescription == xdescription &&
        other.ydescription == ydescription &&
        other.height == height &&
        other.category == category &&
        other.weight == weight &&
        listEquals(other.evolutions, evolutions) &&
        listEquals(other.abilities, abilities) &&
        other.hp == hp &&
        other.attack == attack &&
        other.defense == defense &&
        other.specialAttack == specialAttack &&
        other.specialDefense == specialDefense &&
        other.speed == speed &&
        other.total == total &&
        other.genderless == genderless &&
        other.eggGroups == eggGroups &&
        other.evolvedfrom == evolvedfrom &&
        other.reason == reason &&
        other.baseExp == baseExp;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        imageurl.hashCode ^
        xdescription.hashCode ^
        ydescription.hashCode ^
        height.hashCode ^
        category.hashCode ^
        weight.hashCode ^
        evolutions.hashCode ^
        abilities.hashCode ^
        hp.hashCode ^
        attack.hashCode ^
        defense.hashCode ^
        specialAttack.hashCode ^
        specialDefense.hashCode ^
        speed.hashCode ^
        total.hashCode ^
        genderless.hashCode ^
        eggGroups.hashCode ^
        evolvedfrom.hashCode ^
        reason.hashCode ^
        baseExp.hashCode;
  }
}
