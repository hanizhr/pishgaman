import 'package:flutter_application_3/features/barbari/domain/entities/barbari.dart';

abstract class BarbariRepo {
  Future<List<Barbari>> getBarbariList();
}