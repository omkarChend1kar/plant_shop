import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/service/repositories/plant_repository.dart';
import 'package:plant_shop/view/pages/plants_list_page.dart';
import 'package:plant_shop/view/state/getplantbyid/get_plant_by_id_cubit.dart';
import 'package:plant_shop/view/state/getplants/get_plants_cubit.dart';

void main() {
  final repo = PlantRepository();
  runApp(
    MyApp(
      repo: repo,
    ),
  );
}

class MyApp extends StatelessWidget {
  final PlantRepository repo;
  const MyApp({super.key, required this.repo});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetPlantsCubit>(
          create: (BuildContext context) => GetPlantsCubit(repo),
        ),
        BlocProvider<GetPlantByIdCubit>(
          create: (BuildContext context) => GetPlantByIdCubit(repo),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: PlantListPage(),
      ),
    );
  }
}
