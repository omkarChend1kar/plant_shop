import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:plant_shop/service/models/plant.dart';

class PlantRepository {
  Future<List<Plant>> getPlants() async {
    final String response = await rootBundle.loadString('assets/data/plant.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Plant.fromJson(json)).toList();
  }

  Future<Plant> getPlantById(int id) async {
    final plants = await getPlants();
    return plants.firstWhere((plant) => plant.id == id);
  }
}
