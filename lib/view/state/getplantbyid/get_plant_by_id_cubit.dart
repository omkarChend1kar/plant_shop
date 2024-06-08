import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_shop/service/models/plant.dart';
import 'package:plant_shop/service/repositories/plant_repository.dart';

part 'get_plant_by_id_state.dart';

class GetPlantByIdCubit extends Cubit<GetPlantByIdState> {
  final PlantRepository plantRepository;
  GetPlantByIdCubit(this.plantRepository) : super(GetPlantByIdInitial());

  Future<void> getPlantById(int plantId) async {
    emit(GetPlantByIdLoading());
    try {
      final plants = await plantRepository.getPlantById(plantId);
      emit(GetPlantByIdLoaded(plants));
    } catch (_) {
      emit(GetPlantByIdError());
    }
  }
}
