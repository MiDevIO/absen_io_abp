import 'package:face_id_plus/abp_energy/monitoring/model/hauling_model.dart';

abstract class HaulingState{}

class InitHauling extends HaulingState{}

class LoadingHauling extends HaulingState{}

class LoadedHauling extends HaulingState{
  ApiHauling hauling;

  LoadedHauling(this.hauling);
}

class ErrorHauling extends HaulingState{
  String error;
  ErrorHauling(this.error);
}