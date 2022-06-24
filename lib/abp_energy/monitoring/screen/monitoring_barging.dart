import 'package:face_id_plus/abp_energy/monitoring/bloc/api_repository.dart';
import 'package:face_id_plus/abp_energy/monitoring/bloc/barging_bloc.dart';
import 'package:face_id_plus/abp_energy/monitoring/bloc/barging_state.dart';
import 'package:face_id_plus/abp_energy/monitoring/model/barging_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MonitoringBarging extends StatefulWidget {
  const MonitoringBarging({Key? key}) : super(key: key);

  @override
  State<MonitoringBarging> createState() => _MonitoringBargingState();
}

class _MonitoringBargingState extends State<MonitoringBarging> {
  final Color _warna = const Color.fromARGB(255, 32, 72, 142);
  final TextEditingController dariTgl = TextEditingController();
  final TextEditingController sampaiTgl = TextEditingController();
  bool isLoading = false;
  int page = 1;
  int totalPage = 0;
  late BargingBloc bargingBloc;
  RefreshController refreshController = RefreshController();
  List<DataBarging>? _data;
  bool pullUp = true;
  DateTime dt = DateTime.now();
  DateFormat fmt = DateFormat('dd MMMM yyyy');
  DateTime? tglfilter;

  @override
  void initState() {
    tglfilter = dt;
    _data = [];
    _data!.clear();
    bargingBloc = BargingBloc(ApiRepository());
    bargingBloc.tampilBarging(page);
    initializeDateFormatting();
    super.initState();
  }

  void onUpdate() async {
    setState(() {
      if (page < totalPage) {
        page++;
        bargingBloc.tampilBarging(page);
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
      bargingBloc.tampilBarging(page);
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
        title: const Text("Monitoring Barging"),
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
      ),
      body: Stack(
        children: <Widget>[
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
            create: (context) => bargingBloc,
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
    return BlocListener<BargingBloc, BargingState>(
      listener: (BuildContext context, state) {
        if (state is LoadingBarging) {
        } else if (state is LoadedBarging) {
          var dataBarging = state.barging.monitoringBarging;
          if (dataBarging != null) {
            totalPage = dataBarging.lastPage!;
            if (page == totalPage) {
              pullUp = false;
            } else {
              pullUp = true;
            }
            var apiData = dataBarging.data;
            _data!.addAll(apiData!);
          }
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }
      },
      child:
          BlocBuilder<BargingBloc, BargingState>(builder: (BuildContext context, state) {
        if (state is InitBarging) {
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
        } else if (state is ErrorBarging) {
          return SmartRefresher(
              controller: refreshController,
              onRefresh: () => onRefresh(),
              onLoading: onUpdate,
              enablePullUp: pullUp,
              child: const Center(
                child: Text("Tidak Ada Data"),
              ));
        }
        return SmartRefresher(
          enablePullUp: pullUp,
          enablePullDown: true,
          onRefresh: () => onRefresh(),
          controller: refreshController,
          onLoading: onUpdate,
          child: ListView(
            children: _data!.map((e) => contentBarging(e)).toList(),
          ),
        );
      }),
    );
  }

  Widget contentBarging(DataBarging barging) {
    var f = NumberFormat("###,###.0#", "en_US");
    var pd = f.format(barging.planDaily);
    var ad = f.format(barging.actualDaily);
    var pm = f.format(barging.mtdPlan);
    var am = f.format(barging.mtdActual);
    DateFormat fmt = DateFormat.yMMMMd("id");
    var tanggal = DateTime.parse("${barging.tgl}");
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 32, 72, 142),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Plan Daily",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        pd,
                        style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "Actual Daily",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ad,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 33, 120, 36),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Plan MTD",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        pm,
                        style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "Actual MTD",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        am,
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context, DateTime initDate) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true, maxTime: dt, currentTime: initDate);
  }
}
