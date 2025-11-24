
import 'package:flutter_application_3/features/barbari/data/datasource/barbari_data.dart';
import 'package:flutter_application_3/features/barbari/data/model/barbar_model.dart';
import 'package:flutter_application_3/features/barbari/domain/repository/barbari_repo.dart';
class BarbariRepositoryImpl extends BarbariRepo {
  final BarbariData datasource;


  BarbariRepositoryImpl({required this.datasource});

  @override
  Future<List<BarbarModel>> getBarbariList() async {
    return await datasource.getMokeDataList();
  }
}
