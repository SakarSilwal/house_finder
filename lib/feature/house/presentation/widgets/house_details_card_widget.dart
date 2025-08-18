import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_finder/feature/house/data/models/house_model.dart';
import 'package:house_finder/feature/house/presentation/blocs/house_bloc/house_bloc.dart';
import 'package:house_finder/feature/house/presentation/blocs/house_bloc/house_event.dart';
import 'package:house_finder/feature/house/presentation/blocs/house_bloc/house_state.dart';

class HouseDetailsCardWidget extends StatelessWidget {
  final HouseModel house;

  const HouseDetailsCardWidget({super.key, required this.house});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: BoxBorder.all(color: Colors.blue, width: 2),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  house.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              BlocBuilder<HouseBloc, HouseState>(
                builder: (context, state) {
                  // final isFav = state.favourites.contains(house);
                  final isFav = state.favourites.any(
                    (fav) => fav.id == house.id,
                  );
                  return IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: isFav ? Colors.red : Colors.grey,
                    ),

                    onPressed: () {
                      context.read<HouseBloc>().add(ToggleFavEvent(house));
                    },
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(house.houseColours),
                Text(house.founder),
                Text(house.animal),
                Text(house.element),
                Text(house.ghost),
                Text(house.commonRoom),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
