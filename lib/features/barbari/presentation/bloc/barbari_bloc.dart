import 'package:flutter_application_3/features/barbari/domain/usecase/get-barbari-list.dart';
import 'package:flutter_application_3/features/barbari/presentation/bloc/barbari_event.dart';
import 'package:flutter_application_3/features/barbari/presentation/bloc/barbari_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarbariBloc extends Bloc<BarbariEvent, BarbariState> {
  final GetBarbariList getBarbariList;

  BarbariBloc(this.getBarbariList) : super(BarbariInitial()) {
    on<LoadBarbariList>((event, emit) async {
      emit(BarbariLoading());

      try {
        final barbaris = await getBarbariList();
        emit(BarbariLoaded(barbaris));
      } catch (e) {
        emit(BarbariError('something wrong'));
      }
    });
  }
}
