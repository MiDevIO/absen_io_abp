// ignore_for_file: avoid_print

import 'package:face_id_plus/abp_energy/monitoring/bloc/api_repository.dart';
import 'package:face_id_plus/abp_energy/monitoring/bloc/hauling_state.dart';
import 'package:face_id_plus/abp_energy/monitoring/model/hauling_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HaulingBloc extends Cubit<HaulingState>{
  ApiRepository apiRepository;
  HaulingBloc(this.apiRepository) : super(InitHauling());
  
  tampilHauling(int _page)async{
    emit(LoadingHauling());

    try {
      ApiHauling? resultApi = await apiRepository.getHauling(_page);
      emit(LoadedHauling(resultApi));
    } catch (e) {
      print(e);
      emit(ErrorHauling(e.toString()));
    }
  }
}