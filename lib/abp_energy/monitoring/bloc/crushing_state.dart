import 'package:face_id_plus/abp_energy/monitoring/model/crushing_model.dart';

abstract class CrushingState{}

class InitCrushing extends CrushingState{}

class LoadingCrushing extends CrushingState{}

class LoadedCrushing extends CrushingState{
  ApiCrushing crushing;

  LoadedCrushing(this.crushing);
}

class ErrorCrushing extends CrushingState{
  String error;
  ErrorCrushing(this.error);
}