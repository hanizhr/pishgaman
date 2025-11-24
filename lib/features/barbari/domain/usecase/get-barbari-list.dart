import 'package:flutter_application_3/features/barbari/domain/entities/barbari.dart';
import 'package:flutter_application_3/features/barbari/domain/repository/barbari_repo.dart';

class GetBarbariList{
  final BarbariRepo repository;
  GetBarbariList({required this.repository});

  Future<List<Barbari>> call() async{
    return await repository.getBarbariList();
  }
}