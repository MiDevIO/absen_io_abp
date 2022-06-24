// ignore_for_file: avoid_print

import 'package:face_id_plus/abp_energy/sarpras/bloc/api_repository.dart';
import 'package:face_id_plus/abp_energy/sarpras/bloc/sarana_state.dart';
import 'package:face_id_plus/abp_energy/sarpras/model/sarana_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaranaBloc extends Cubit<SaranaState>{
  ApiRepository apiRepository;
  SaranaBloc(this.apiRepository) : super(InitSarana());
  
  tampilSarana(int _page)async{
    emit(LoadingSarana());

    try {
      ApiSarana? resultApi = await apiRepository.getSarana(_page);
      emit(LoadedSarana(resultApi));
    } catch (e) {
      print(e);
      emit(ErrorSarana(e.toString()));
    }
  }
}