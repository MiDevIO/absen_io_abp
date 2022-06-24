import 'package:face_id_plus/abp_energy/sarpras/bloc/api_repository.dart';
import 'package:face_id_plus/abp_energy/sarpras/bloc/sarana_bloc.dart';
import 'package:face_id_plus/abp_energy/sarpras/bloc/sarana_state.dart';
import 'package:face_id_plus/abp_energy/sarpras/model/sarana_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListSarana extends StatefulWidget {
  const ListSarana({Key? key}) : super(key: key);

  @override
  State<ListSarana> createState() => _ListSaranaState();
}

class _ListSaranaState extends State<ListSarana>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  int page = 1;
  int totalPage = 0;
  late SaranaBloc saranaBloc;
  RefreshController refreshController = RefreshController();
  List<DataSarana>? _data;
  bool pullUp = true;
  final TextStyle _style = const TextStyle(fontWeight: FontWeight.bold);

  @override
  void initState() {
    _data = [];
    _data!.clear();
    saranaBloc = SaranaBloc(ApiRepository());
    saranaBloc.tampilSarana(page);
    super.initState();
  }

  void onUpdate() async {
    setState(() {
      if (page < totalPage) {
        page++;
        saranaBloc.tampilSarana(page);
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
      saranaBloc.tampilSarana(page);
      Future.delayed(const Duration(seconds: 2), () {
        refreshController.refreshCompleted();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Sarana"),
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
      ),
      body: BlocProvider(
        create: (context) => saranaBloc,
        child: content(),
      ),
    );
  }

  Widget dataContent(DataSarana data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text("${data.noLv} (${data.noPol})", style: _style,),
          ),
        ),
      ),
    );
  }

  Widget content() {
    return BlocListener<SaranaBloc, SaranaState>(
      listener: (BuildContext context, state) {
        if (state is LoadingSarana) {
        } else if (state is LoadedSarana) {
          var dataSarana = state.apisarana.sarana;
          if (dataSarana != null) {
            totalPage = dataSarana.last_page!;
            if (page == totalPage) {
              pullUp = false;
            } else {
              pullUp = true;
            }
            var apiData = dataSarana.data;
            _data!.addAll(apiData!);
          }
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }
      },
      child: BlocBuilder<SaranaBloc, SaranaState>(
          builder: (BuildContext context, state) {
        if (state is InitSarana) {
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
        } else if (state is ErrorSarana) {
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
          child: ListView(
            children: _data!.map((e) => dataContent(e)).toList(),
          ),
        );
      }),
    );
  }
}
