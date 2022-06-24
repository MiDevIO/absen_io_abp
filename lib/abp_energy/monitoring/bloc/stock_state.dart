import 'package:face_id_plus/abp_energy/monitoring/model/stock_model.dart';

abstract class StockState{}

class InitStock extends StockState{}

class LoadingStock extends StockState{}

class LoadedStock extends StockState{
  ApiStock apiStock;

  LoadedStock(this.apiStock);
}

class ErrorStock extends StockState{
  String error;
  ErrorStock(this.error);
}