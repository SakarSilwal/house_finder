import 'package:equatable/equatable.dart';
import 'package:house_finder/feature/house/data/models/house_model.dart';

sealed class HouseEvent extends Equatable {
  const HouseEvent();

  @override
  List<Object> get props => [];
}

final class FetchHouseDetailsEvent extends HouseEvent {
  const FetchHouseDetailsEvent();

  @override
  List<Object> get props => [];
}

final class ToggleFavEvent extends HouseEvent {
  final HouseModel house;
  const ToggleFavEvent(this.house);

  @override
  List<Object> get props => [house];
}

final class LoadCachedHouseEvent extends HouseEvent {
  const LoadCachedHouseEvent();

  @override
  List<Object> get props => [];
}
