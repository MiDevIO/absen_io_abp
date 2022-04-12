import 'package:face_id_plus/model/karyawan_model.dart';
import 'package:flutter/material.dart';

class ShowKaryawan extends StatefulWidget {
  DataKaryawan? dataKaryawan;
  ShowKaryawan({Key? key, this.dataKaryawan}) : super(key: key);

  @override
  State<ShowKaryawan> createState() => _ShowKaryawanState();
}

class _ShowKaryawanState extends State<ShowKaryawan> {
  String? foto;

  @override
  Widget build(BuildContext context) {
    var data = widget.dataKaryawan;
    if (data!.photo_profile != null) {
      foto = data.photo_profile;
    } else {
      foto = null;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
        leading: InkWell(
          splashColor: const Color(0xff000000),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xff000000),
          ),
          onTap: () {
            Navigator.maybePop(context);
          },
        ),
        title: const Text(
          "Detail Karyawan",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: double.infinity,
              height: 600,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 8,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 110, left: 110),
                          child: Container(
                            width: 130,
                            height: 130,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 1, right: 1, bottom: 3, top: 3),
                                child: (foto != null)
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(200),
                                        child: Image.network(
                                          foto!,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : Icon(Icons.person,
                                        size: 60, color: Colors.grey)),
                          ),
                        ),
                      ),
                    ),
                    content()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget content() {
    var _data = widget.dataKaryawan;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Nama Lengkap",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data!.nama_lengkap}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black)),
          ],
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Username",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.username}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("NIK", style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.nik}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Email", style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.email}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Departemen",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.department}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Divisi", style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.section}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Tanggal Masuk",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.tglEntry}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Dept", style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.dept}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Sect", style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.sect}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Nama Perusahaan",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.nama_perusahaan}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
      ],
    );
  }
}