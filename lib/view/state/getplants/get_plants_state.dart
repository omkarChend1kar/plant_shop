part of 'get_plants_cubit.dart';

@immutable
abstract class GetPlantsState {}

class GetPlantsInitial extends GetPlantsState {}

class GetPlantsLoading extends GetPlantsState {}

class GetPlantsLoaded extends GetPlantsState {
  final List<Plant> plants;

  GetPlantsLoaded(this.plants);
}

class GetPlantsError extends GetPlantsState {}
