// ignore_for_file: must_be_immutable

import 'package:face_id_plus/absensi/model/karyawan_model.dart';
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
      body: Stack(
        children:[ Center(
          child: SizedBox(
            width: double.infinity,
            height: 550,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 115),
                  child: Column(
                    children: <Widget>[
                      content(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Card(
              elevation: 18,
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.only(right: 110, left: 110),
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: (foto != null)
                      ? ClipRRect(
                          borderRadius:
                              BorderRadius.circular(200),
                          child: Image.network(
                            foto!,
                            fit: BoxFit.fill,
                          ),
                        )
                      : const Icon(Icons.person,
                          size: 60, color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget content() {
    var _data = widget.dataKaryawan;
    var seksi = _data!.sect;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Nama Lengkap",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.nama_lengkap}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black)),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Username",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.username}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("NIK", style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.nik}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Email", style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.email}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Departemen",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.department}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Divisi", style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.section}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Dept", style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.dept}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Sect", style: TextStyle(fontSize: 12, color: Colors.black)),
            (seksi == null)
                ? Text(seksi ?? "-",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black))
                : Text(seksi,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black))
          ],
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Nama Perusahaan",
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Text("${_data.nama_perusahaan}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ],
        ),
      ],
    );
  }
}
