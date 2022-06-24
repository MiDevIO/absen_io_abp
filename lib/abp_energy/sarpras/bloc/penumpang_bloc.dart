// ignore_for_file: avoid_print

import 'package:face_id_plus/abp_energy/sarpras/bloc/api_repository.dart';
import 'package:face_id_plus/abp_energy/sarpras/bloc/penumpang_state.dart';
import 'package:face_id_plus/abp_energy/sarpras/model/penumpang_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PenumpangBloc extends Cubit<PenumpangState>{
  ApiRepository apiRepository;
  PenumpangBloc(this.apiRepository) : super(InitPenumpang());
  
  tampilPenumpang(int _page)async{
    emit(LoadingPenumpang());

    try {
      ApiPenumpang? resultApi = await apiRepository.getPenumpang(_page);
      emit(LoadedPenumpang(resultApi));
    } catch (e) {
      print(e);
      emit(ErrorPenumpang(e.toString()));
    }
  }
}