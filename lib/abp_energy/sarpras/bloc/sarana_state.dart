import 'package:face_id_plus/abp_energy/sarpras/model/sarana_model.dart';

abstract class SaranaState{}

class InitSarana extends SaranaState{}

class LoadingSarana extends SaranaState{}

class LoadedSarana extends SaranaState{
  ApiSarana apisarana;

  LoadedSarana(this.apisarana);
}

class ErrorSarana extends SaranaState{
  String error;
  ErrorSarana(this.error);
}