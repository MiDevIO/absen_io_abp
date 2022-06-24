import 'package:face_id_plus/abp_energy/monitoring/model/ob_model.dart';

abstract class OBState{}

class InitOB extends OBState{}

class LoadingOB extends OBState{}

class LoadedOB extends OBState{
  ApiOB ob;

  LoadedOB(this.ob);
}

class ErrorOB extends OBState{
  String error;
  ErrorOB(this.error);
}