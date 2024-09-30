import 'package:flutter/material.dart';
import '../models/place_model.dart';

class PopularDestinationWidget extends StatelessWidget {
  final Place place;

  PopularDestinationWidget({required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(place.imageUrl),
          Text(place.name),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              Text(place.rating.toString())
            ],
          )
        ],
      ),
    );
  }
}
