import 'package:face_id_plus/abp_energy/sarpras/model/penumpang_model.dart';

abstract class PenumpangState{}

class InitPenumpang extends PenumpangState{}

class LoadingPenumpang extends PenumpangState{}

class LoadedPenumpang extends PenumpangState{
  ApiPenumpang apiPenumpang;

  LoadedPenumpang(this.apiPenumpang);
}

class ErrorPenumpang extends PenumpangState{
  String error;
  ErrorPenumpang(this.error);
}