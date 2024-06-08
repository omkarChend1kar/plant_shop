import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/service/models/plant.dart';
import 'package:plant_shop/view/state/getplants/get_plants_cubit.dart';
import 'package:plant_shop/view/widgets/plant_widget.dart';

class PlantListPage extends StatefulWidget {
  const PlantListPage({super.key});

  @override
  State<PlantListPage> createState() => _PlantListPageState();
}

class _PlantListPageState extends State<PlantListPage> {
  @override
  void initState() {
    context.read<GetPlantsCubit>().getPlants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180.0), // Custom height
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          flexibleSpace: Container(
            margin: const EdgeInsets.only(top: 60),
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome to',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Plant Shop',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Color(
                            0xFF00B761,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_cart))
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIconColor: Color(
                          0xFF00B761,
                        ),
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Color(0xFFF1F1F1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(
                        0xFF00B761,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Button pressed action
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Icon(Icons.tune_sharp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetPlantsCubit, GetPlantsState>(
          builder: (context, state) {
            if (state is GetPlantsLoaded) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: state.plants.length,
                itemBuilder: (context, index) {
                  final Plant plant = state.plants[index];
                  return PlantWidget(
                    imageUrl: plant.image!,
                    name: plant.name,
                    price: plant.price,
                    isAdded: plant.isAdded,
                    isLiked: plant.isLiked,
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

