import 'package:dio/dio.dart';
import 'package:house_finder/feature/house/data/models/house_model.dart';

class HouseApiService {
  static Future<List<HouseModel>> fetchAllHouseDetails() async {
    try {
      final Dio dio = Dio();
      final String url = 'https://wizard-world-api.herokuapp.com/Houses';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> houseJsonList = response.data ?? [];
        return houseJsonList.map((json) => HouseModel.fromJson(json)).toList();
      } else {
        throw Exception('failed to  fetch house details');
      }
    } catch (e) {
      throw Exception('Error fetching house details $e');
    }
  }
}
