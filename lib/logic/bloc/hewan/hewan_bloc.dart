import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi_0029/data/repositories/hewan_repository.dart';
import 'package:restapi_0029/logic/bloc/hewan/hewan_event.dart';
import 'package:restapi_0029/logic/bloc/hewan/hewan_state.dart';

class HewanBloc extends Bloc<HewanEvent, HewanState> {
  final HewanRepository repository;

  HewanBloc({required this.repository}) : super(HewanInitial()) {
    on<FetchHewan>((event, emit) async {
      emit(HewanLoading());
      try {
        final list = await repository.getAllHewan();
        emit(HewanLoaded(list));
      } catch (e) {
        emit(HewanError(e.toString()));
      }
    });

    
  }
}