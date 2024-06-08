part of 'get_plant_by_id_cubit.dart';

@immutable
abstract class GetPlantByIdState {}

class GetPlantByIdInitial extends GetPlantByIdState {}

class GetPlantByIdLoaded extends GetPlantByIdState {
  final Plant plant;
  GetPlantByIdLoaded(this.plant);
}

class GetPlantByIdLoading extends GetPlantByIdState {}

class GetPlantByIdError extends GetPlantByIdState {}
