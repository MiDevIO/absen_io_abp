import 'package:face_id_plus/abp_energy/monitoring/bloc/api_repository.dart';
import 'package:face_id_plus/abp_energy/monitoring/bloc/stock_bloc.dart';
import 'package:face_id_plus/abp_energy/monitoring/bloc/stock_state.dart';
import 'package:face_id_plus/abp_energy/monitoring/model/stock_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MonitoringStockRoom extends StatefulWidget {
  const MonitoringStockRoom({Key? key}) : super(key: key);

  @override
  State<MonitoringStockRoom> createState() => _MonitoringStockRoomState();
}

class _MonitoringStockRoomState extends State<MonitoringStockRoom> {
  final Color _warna = const Color.fromARGB(255, 32, 72, 142);
  final TextEditingController dariTgl = TextEditingController();
  final TextEditingController sampaiTgl = TextEditingController();
  bool isLoading = false;
  int page = 1;
  int totalPage = 0;
  late StockBloc stockBloc;
  RefreshController refreshController = RefreshController();
  List<DataStock>? _data;
  bool pullUp = true;
  DateTime dt = DateTime.now();
  DateFormat fmt = DateFormat('dd MMMM yyyy');
  DateTime? tglfilter;

  @override
  void initState() {
    tglfilter = dt;
    _data = [];
    _data!.clear();
    stockBloc = StockBloc(ApiRepository());
    stockBloc.tampilStock(page);
    initializeDateFormatting();
    super.initState();
  }

  void onUpdate() async {
    setState(() {
      if (page < totalPage) {
        page++;
        stockBloc.tampilStock(page);
      } else {
        refreshController.refreshCompleted();
        refreshController.loadComplete();
      }
    });
  }

  void onRefresh() async {
    setState(() {
      _data!.clear();
      page = 1;
      stockBloc.tampilStock(page);
      Future.delayed(const Duration(seconds: 2), () {
        refreshController.refreshCompleted();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 72, 142),
        title: const Text("Monitoring Stock Product"),
        leading: InkWell(
          splashColor: const Color(0xff000000),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.maybePop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.date_range)
          ),
        ],
      ),
      body: Stack(
        children: <Widget> [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.lightBlueAccent, Colors.white]
              ),
            ),
          ),
          BlocProvider(
            create: (context) => stockBloc,
            child: Column(
              children: [
                bagianTgl(),
                Expanded(child: content()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bagianTgl() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 20,
        child: formTgl(),
      ),
    );
  }

  Widget formTgl() {
    return Row(
      children: [
        SizedBox(
          width: 170,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: _warna, width: 2),
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: _warna, width: 2),
                  ),
                  labelText: "Dari Tanggal",
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, color: _warna),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: Colors.green,
                  hintText: 'Tanggal'),
              controller: dariTgl,
              onTap: () async {
                var tgl = await _selectDate(context, tglfilter!);
                if (tgl != null) {
                  setState(() {
                    dariTgl.text = fmt.format(tgl);
                  });
                }
              },
              readOnly: true,
            ),
          ),
        ),
        Text(
          "-",
          style: TextStyle(
            color: _warna,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 170,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: _warna, width: 2),
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: _warna, width: 2),
                  ),
                  labelText: "Sampai Tanggal",
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, color: _warna),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: Colors.green,
                  hintText: 'Tanggal'),
              controller: sampaiTgl,
              onTap: () async {
                var tgl = await _selectDate(context, tglfilter!);
                if (tgl != null) {
                  setState(() {
                    sampaiTgl.text = fmt.format(tgl);
                  });
                }
              },
              readOnly: true,
            ),
          ),
        ),
        Card(
          color: const Color.fromARGB(255, 32, 72, 142),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white)),
        ),
      ],
    );
  }

  Widget content() {
    return BlocListener<StockBloc, StockState>(
      listener: (BuildContext context, state) {
        if (state is LoadingStock) {
        } else if (state is LoadedStock) {
          var dataStock = state.apiStock.monitoringStock;
          if (dataStock != null) {
            totalPage = dataStock.lastPage!;
            if (page == totalPage) {
              pullUp = false;
            } else {
              pullUp = true;
            }
            var apiData = dataStock.data;
            _data!.addAll(apiData!);
          }
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }
      },
      child: BlocBuilder<StockBloc, StockState>(
          builder: (BuildContext context, state) {
        if (state is InitStock) {
          return SmartRefresher(
            controller: refreshController,
            onRefresh: () => onRefresh(),
            onLoading: onUpdate,
            enablePullUp: pullUp,
            child: Center(
              child: Image.asset(
                'assets/load.gif',
                width: 70,
              ),
            ),
          );
        } else if (state is ErrorStock) {
          return SmartRefresher(
              controller: refreshController,
              onRefresh: () => onRefresh(),
              onLoading: onUpdate,
              enablePullUp: pullUp,
              child: const Center(
                child: Text("Tidak Ada Data Waiting"),
              ));
        }
        return SmartRefresher(
          enablePullUp: pullUp,
          enablePullDown: true,
          onRefresh: () => onRefresh(),
          controller: refreshController,
          onLoading: onUpdate,
          child: GridView.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: (1 / 0.7),
            children: _data!.map((e) => contentStock(e)).toList(),
          ),
        );
      }),
    );
  }

  Widget contentStock(DataStock stock) {
    var f = NumberFormat("###,###.0#", "en_US");
    var sp = f.format(stock.stockRom);
    DateFormat fmt = DateFormat.yMMMMd("id");
    var tanggal = DateTime.parse("${stock.tgl}");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 32, 72, 142),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    fmt.format(tanggal),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Stock Product",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "$sp MT",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context, DateTime initDate) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true, maxTime: dt, currentTime: initDate);
  }

}
