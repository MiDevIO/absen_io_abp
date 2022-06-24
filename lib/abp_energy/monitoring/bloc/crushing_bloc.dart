import 'package:face_id_plus/abp_energy/monitoring/bloc/api_repository.dart';
import 'package:face_id_plus/abp_energy/monitoring/bloc/crushing_state.dart';
import 'package:face_id_plus/abp_energy/monitoring/model/crushing_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrushingBloc extends Cubit<CrushingState>{
  ApiRepository apiRepository;
  CrushingBloc(this.apiRepository) : super(InitCrushing());
  
  tampilCrushing(int _page)async{
    emit(LoadingCrushing());

    try {
      ApiCrushing? resultApi = await apiRepository.getCrushing(_page);
      emit(LoadedCrushing(resultApi));
    } catch (e) {
      // ignore: avoid_print
      print(e);
      emit(ErrorCrushing(e.toString()));
    }
  }
}