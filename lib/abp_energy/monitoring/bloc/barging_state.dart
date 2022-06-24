import 'package:face_id_plus/abp_energy/monitoring/model/barging_model.dart';

abstract class BargingState{}

class InitBarging extends BargingState{}

class LoadingBarging extends BargingState{}

class LoadedBarging extends BargingState{
  ApiBarging barging;

  LoadedBarging(this.barging);
}

class ErrorBarging extends BargingState{
  String error;
  ErrorBarging(this.error);
}