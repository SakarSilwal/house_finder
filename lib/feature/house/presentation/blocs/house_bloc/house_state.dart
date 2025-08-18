import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:house_finder/feature/house/data/models/house_model.dart';

enum HouseStatus { inital, loading, success, error }

class HouseState extends Equatable {
  final List<HouseModel> houseModel;
  final List<HouseModel> favourites;
  final HouseStatus houseStatus;
  final Color clr;
  const HouseState({
    this.houseModel = const [],
    this.houseStatus = HouseStatus.inital,
    this.clr = Colors.grey,
    this.favourites = const [],
  });

  HouseState copyWith({
    List<HouseModel>? houseModel,
    HouseStatus? houseStatus,
    Color? clr,
    List<HouseModel>? favourites,
  }) {
    return HouseState(
      houseModel: houseModel ?? this.houseModel,
      houseStatus: houseStatus ?? this.houseStatus,
      clr: clr ?? this.clr,
      favourites: favourites ?? this.favourites,
    );
  }

  @override
  List<Object> get props => [houseModel, houseStatus, clr, favourites];
}
