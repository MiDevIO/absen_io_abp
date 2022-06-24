import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:face_id_plus/abp_energy/sarpras/bloc/api_repository.dart';
import 'package:face_id_plus/abp_energy/sarpras/bloc/penumpang_bloc.dart';
import 'package:face_id_plus/abp_energy/sarpras/bloc/penumpang_state.dart';
import 'package:face_id_plus/abp_energy/sarpras/model/penumpang_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListPenumpang extends StatefulWidget {
  const ListPenumpang({Key? key}) : super(key: key);

  @override
  State<ListPenumpang> createState() => _ListPenumpangState();
}

class _ListPenumpangState extends State<ListPenumpang>
    with SingleTickerProviderStateMixin {
  final TextStyle _style = const TextStyle(fontWeight: FontWeight.bold);
  bool isLoading = false;
  int page = 1;
  int totalPage = 0;
  late PenumpangBloc penumpangBloc;
  RefreshController refreshController = RefreshController();
  List<DataPenumpang>? _data;
  bool pullUp = true;
  bool _folded = true;
  var loading = false;

  @override
  void initState() {
    // _data = [];
    // _data!.clear();
    // penumpangBloc = PenumpangBloc(ApiRepository());
    // penumpangBloc.tampilPenumpang(page);
    super.initState();
    getPenumpang().then((value) {
      setState(() {
        _penumpang = value;
        caripenumpang = _penumpang;
      });
    });
  }

  @override
  void dispose() {
    _penumpang.clear();
    caripenumpang.clear();
    super.dispose();
  }

  void onUpdate() async {
    setState(() {
      if (page < totalPage) {
        page++;
        penumpangBloc.tampilPenumpang(page);
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
      penumpangBloc.tampilPenumpang(page);
      Future.delayed(const Duration(seconds: 2), () {
        refreshController.refreshCompleted();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("List Penumpang"),
          backgroundColor: const Color.fromARGB(255, 32, 72, 142),
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
            Row(
              children: [
                _cari(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: loading
                    ? Center(child: Image.asset('assets/load.gif', width: 70,))
                    : test())
          ],
        ));
  }

  Widget test() {
    return ListView.builder(
        itemCount: caripenumpang.length,
        itemBuilder: (context, i) {
          DataPenumpang p = caripenumpang[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 65,
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${p.nik}", style: _style),
                      Column(
                        children: [
                          Text(
                            "${p.nama}",
                            style: _style,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${p.jabatan}",
                            style: _style,
                          ),
                        ],
                      ),
                      Checkbox(value: false, onChanged: (bool? value) {}),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget dataContent(DataPenumpang data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 65,
        child: Card(
          elevation: 15,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${data.nik}", style: _style),
                Column(
                  children: [
                    Text(
                      "${data.nama}",
                      style: _style,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${data.jabatan}",
                      style: _style,
                    ),
                  ],
                ),
                Checkbox(value: false, onChanged: (bool? value) {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget content() {
  //   return BlocListener<PenumpangBloc, PenumpangState>(
  //     listener: (BuildContext context, state) {
  //       if (state is LoadingPenumpang) {
  //       } else if (state is LoadedPenumpang) {
  //         var dataPenumpang = state.apiPenumpang.listPenumpang;
  //         if (dataPenumpang != null) {
  //           totalPage = dataPenumpang.last_page!;
  //           if (page == totalPage) {
  //             pullUp = false;
  //           } else {
  //             pullUp = true;
  //           }
  //           var apiData = dataPenumpang.data;
  //           _data!.addAll(apiData!);
  //         }
  //         refreshController.loadComplete();
  //         refreshController.refreshCompleted();
  //       }
  //     },
  //     child: BlocBuilder<PenumpangBloc, PenumpangState>(
  //         builder: (BuildContext context, state) {
  //       if (state is InitPenumpang) {
  //         return SmartRefresher(
  //           controller: refreshController,
  //           onRefresh: () => onRefresh(),
  //           onLoading: onUpdate,
  //           enablePullUp: pullUp,
  //           child: Center(
  //             child: Image.asset(
  //               'assets/load.gif',
  //               width: 70,
  //             ),
  //           ),
  //         );
  //       } else if (state is ErrorPenumpang) {
  //         return SmartRefresher(
  //             controller: refreshController,
  //             onRefresh: () => onRefresh(),
  //             onLoading: onUpdate,
  //             enablePullUp: pullUp,
  //             child: const Center(
  //               child: Text("Tidak Ada Data Waiting"),
  //             ));
  //       }
  //       return SmartRefresher(
  //         enablePullUp: pullUp,
  //         enablePullDown: true,
  //         onRefresh: () => onRefresh(),
  //         controller: refreshController,
  //         onLoading: onUpdate,
  //         child: test()
  //         // ListView(
  //         //   children: _data!.map((e) => dataContent(e)).toList(),
  //         // ),
  //       );
  //     }),
  //   );
  // }

  Widget _cari() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: _folded ? 56 : 300,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: const Color.fromARGB(255, 32, 72, 142),
        //boxShadow: kElevationToShadow[1],
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 16),
            child: !_folded
                ? TextField(
                    cursorColor: Colors.green,
                    cursorWidth: 5,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Cari Karyawan...',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    controller: cariController,
                    onChanged: (string) {
                      setState(() {
                        caripenumpang = _penumpang
                            .where((e) =>
                                (e.nama!.toLowerCase())
                                    .contains(string.toLowerCase()) ||
                                e.nik!
                                    .toLowerCase()
                                    .contains(string.toLowerCase()))
                            .toList();
                      });
                    },
                  )
                : null,
          )),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                hoverColor: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: const Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: const Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(
                    _folded ? Icons.search : Icons.close,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                    cariController.clear();
                    caripenumpang = _penumpang;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  onSearch(String text) {
    caripenumpang.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var e in _penumpang) {
      if (e.nama!.toLowerCase().contains(text.toLowerCase()) ||
          e.nik!.toLowerCase().contains(text.toLowerCase())) {
        caripenumpang.add(e);
      }
    }
    setState(() {});
  }

  List<DataPenumpang> caripenumpang = [];
  List<DataPenumpang> _penumpang = [];
  TextEditingController cariController = TextEditingController();

  Future<List<DataPenumpang>> getPenumpang() async {
    setState(() {
      loading = true;
    });
    var url = "https://lp.abpjobsite.com/api/list/penumpang/test";
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    var jsonArray = jsonData['list_penumpang'];

    for (var json in jsonArray) {
      DataPenumpang penumpang = DataPenumpang(
        nik: json['nik'],
        nama: json['nama'],
        department: json['department'],
        section: json['section'],
        jabatan: json['jabatan'],
        flag: json['flag'],
        userEntry: json['user_entry'],
        tanggalEntry: json['tanggal_entry'],
      );
      _penumpang.add(penumpang);
      loading = false;
    }
    return _penumpang;
  }
}
