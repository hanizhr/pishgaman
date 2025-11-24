import 'package:flutter_application_3/features/barbari/domain/entities/barbari.dart';

abstract class BarbariState {}

class BarbariInitial extends BarbariState{}

class BarbariLoading extends BarbariState{}

class BarbariLoaded extends BarbariState{
  final List<Barbari> barvaris;
  BarbariLoaded(this.barvaris);
}

class BarbariError extends BarbariState{
  final String message;
  BarbariError(this.message);
}