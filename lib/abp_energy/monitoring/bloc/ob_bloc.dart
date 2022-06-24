// ignore_for_file: avoid_print

import 'package:face_id_plus/abp_energy/monitoring/bloc/api_repository.dart';
import 'package:face_id_plus/abp_energy/monitoring/bloc/ob_state.dart';
import 'package:face_id_plus/abp_energy/monitoring/model/ob_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OBBloc extends Cubit<OBState>{
  ApiRepository apiRepository;
  OBBloc(this.apiRepository) : super(InitOB());
  
  tampilOB(int _page)async{
    emit(LoadingOB());

    try {
      ApiOB? resultApi = await apiRepository.getOB(_page);
      emit(LoadedOB(resultApi));
    } catch (e) {
      print(e);
      emit(ErrorOB(e.toString()));
    }
  }
}