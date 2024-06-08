// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PlantWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isLiked;
  final bool isAdded;
  final num price;

  const PlantWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.isLiked,
    required this.isAdded,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFF3F3F3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    child: Image.asset(
                      imageUrl,
                      width: double.infinity,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isLiked
                          ? Colors.red[50]
                          : const Color.fromARGB(68, 158, 158, 158),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          100,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        size: 18,
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    color:
                        isAdded ? Colors.green[100] : const Color(0xFFC9C9C9),
                    Icons.add_box_rounded,
                    size: 30,
                  ),
                  onPressed: () {
                    // Add to cart action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
