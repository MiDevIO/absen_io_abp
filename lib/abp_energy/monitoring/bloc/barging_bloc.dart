import 'package:face_id_plus/abp_energy/monitoring/bloc/api_repository.dart';
import 'package:face_id_plus/abp_energy/monitoring/bloc/barging_state.dart';
import 'package:face_id_plus/abp_energy/monitoring/model/barging_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BargingBloc extends Cubit<BargingState>{
  ApiRepository apiRepository;
  BargingBloc(this.apiRepository) : super(InitBarging());
  
  tampilBarging(int _page)async{
    emit(LoadingBarging());

    try {
      ApiBarging? resultApi = await apiRepository.getBarging(_page);
      emit(LoadedBarging(resultApi));
    } catch (e) {
      // ignore: avoid_print
      print(e);
      emit(ErrorBarging(e.toString()));
    }
  }
}