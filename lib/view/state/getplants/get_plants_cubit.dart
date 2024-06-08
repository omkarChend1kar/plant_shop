import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_shop/service/models/plant.dart';
import 'package:plant_shop/service/repositories/plant_repository.dart';

part 'get_plants_state.dart';

class GetPlantsCubit extends Cubit<GetPlantsState> {
  final PlantRepository plantRepository;
  GetPlantsCubit(
    this.plantRepository,
  ) : super(GetPlantsInitial());

  Future<void> getPlants() async {
    emit(GetPlantsLoading());
    try {
      final plants = await plantRepository.getPlants();
      emit(GetPlantsLoaded(plants));
    } catch (_) {
      emit(GetPlantsError());
    }
  }
}
