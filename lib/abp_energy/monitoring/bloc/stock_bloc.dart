// ignore_for_file: avoid_print

import 'package:face_id_plus/abp_energy/monitoring/bloc/api_repository.dart';
import 'package:face_id_plus/abp_energy/monitoring/bloc/stock_state.dart';
import 'package:face_id_plus/abp_energy/monitoring/model/stock_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockBloc extends Cubit<StockState>{
  ApiRepository apiRepository;
  StockBloc(this.apiRepository) : super(InitStock());
  
  tampilStock(int _page)async{
    emit(LoadingStock());

    try {
      ApiStock? resultApi = await apiRepository.getStock(_page);
      emit(LoadedStock(resultApi));
    } catch (e) {
      print(e);
      emit(ErrorStock(e.toString()));
    }
  }
}