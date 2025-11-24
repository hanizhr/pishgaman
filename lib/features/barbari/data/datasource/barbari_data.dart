import 'package:flutter_application_3/features/barbari/data/model/barbar_model.dart';

class BarbariData {
  Future<List<BarbarModel>> getMokeDataList() async {
    final data = [
      {
        "title": "مشهد تهران",
        "badge": "فوری",
        "weight": 120
      },
      {
        "title": "زنجان بندعباس",
        "badge": "معمولی",
        "weight": 40
      },
      {
        "title": "شاهرود سمنان",
        "badge": "فوری",
        "weight": 300
      },
      {
        "title": "رشت شاهرود",
        "badge": "معمولی",
        "weight": 70
      },
    ];

    return data.map((e)=> BarbarModel.fromJson(e)).toList();
  }
}