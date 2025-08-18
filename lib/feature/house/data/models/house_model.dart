import 'package:hive/hive.dart';
part 'house_model.g.dart';

@HiveType(typeId: 0)
class HouseModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String houseColours;

  @HiveField(3)
  final String founder;

  @HiveField(4)
  final String animal;

  @HiveField(5)
  final String element;

  @HiveField(6)
  final String ghost;

  @HiveField(7)
  final String commonRoom;

  HouseModel({
    required this.id,
    required this.name,
    required this.houseColours,
    required this.founder,
    required this.animal,
    required this.element,
    required this.ghost,
    required this.commonRoom,
  });

  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
      id: json['id'],
      name: json['name'],
      houseColours: json['houseColours'],
      founder: json['founder'],
      animal: json['animal'],
      element: json['element'],
      ghost: json['ghost'],
      commonRoom: json['commonRoom'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'houseColours': houseColours,
      'founder': founder,
      'animal': animal,
      'element': element,
      'ghost': ghost,
      'commonRoom': commonRoom,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HouseModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
