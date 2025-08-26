import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:house_finder/feature/house/data/data_source/house_remote_datasource.dart';
import 'package:house_finder/feature/house/data/models/house_model.dart';
import 'package:house_finder/feature/house/presentation/blocs/house_bloc/house_event.dart';
import 'package:house_finder/feature/house/presentation/blocs/house_bloc/house_state.dart';

class HouseBloc extends Bloc<HouseEvent, HouseState> {
  HouseBloc() : super(HouseState()) {
    on<FetchHouseDetailsEvent>(_onFetchHouseDetailsMethod);
    on<ToggleFavEvent>(_onToggleFavMethod);
    on<LoadCachedHouseEvent>(_onLoadCachedHouseMethod);
  }

  FutureOr<void> _onFetchHouseDetailsMethod(
    FetchHouseDetailsEvent event,
    Emitter<HouseState> emit,
  ) async {
    emit(state.copyWith(houseStatus: HouseStatus.loading));
    // final service = await HouseApiService.fetchAllHouseDetails();

    //opening hive boxes
    final houseBox = Hive.box<HouseModel>('houses');

    final cached = houseBox.values.toList();
    if (cached.isNotEmpty) {
      emit(
        state.copyWith(houseStatus: HouseStatus.success, houseModel: cached),
      );
    }
    try {
      final fresh = await HouseApiService.fetchAllHouseDetails();
      await houseBox.clear();
      await houseBox.addAll(fresh);

      emit(state.copyWith(houseStatus: HouseStatus.success, houseModel: fresh));
    } catch (e) {
      if (cached.isEmpty) {
        emit(state.copyWith(houseStatus: HouseStatus.error));
      }
    }
  }

  FutureOr<void> _onToggleFavMethod(
    ToggleFavEvent event,
    Emitter<HouseState> emit,
  ) async {
    final favBox = Hive.box<HouseModel>('favourites');
    final updatedFav = List<HouseModel>.from(state.favourites);

    final exists = updatedFav.any((fav) => fav.id == event.house.id);

    if (exists) {
      updatedFav.removeWhere((fav) => fav.id == event.house.id);
      emit(state.copyWith(favourites: updatedFav));
      await favBox.delete(event.house.id);
    } else {
      updatedFav.add(event.house);
      emit(state.copyWith(favourites: updatedFav));

      await favBox.put(event.house.id, event.house);
    }
  }

  FutureOr<void> _onLoadCachedHouseMethod(
    LoadCachedHouseEvent event,
    Emitter<HouseState> emit,
  ) async {
    print("LoadCachedHouseEvent triggered");
    log("LoadCachedHouseEvent triggered");

    final houseBox = Hive.box<HouseModel>('houses');
    final favBox = Hive.box<HouseModel>('favourites');
    print("Favs from Hive: ${favBox.values.toList()}");
    log("Favs from Hive: ${favBox.values.toList()}");
    final cachedHouses = houseBox.values.toList();
    final cachedFav = favBox.values.toList();

    emit(
      state.copyWith(
        houseModel: cachedHouses,
        favourites: cachedFav,
        houseStatus: cachedHouses.isNotEmpty
            ? HouseStatus.success
            : HouseStatus.error,
      ),
    );
  }
}
