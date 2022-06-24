import 'package:face_id_plus/abp_energy/sarpras/screen/list_sapras/list_driver.dart';
import 'package:face_id_plus/abp_energy/sarpras/screen/list_sapras/list_penumpang.dart';
import 'package:face_id_plus/abp_energy/sarpras/screen/list_sapras/list_sarana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class FormSapras extends StatefulWidget {
  const FormSapras({Key? key}) : super(key: key);

  @override
  State<FormSapras> createState() => _FormSaprasState();
}

class _FormSaprasState extends State<FormSapras> {
  final _scafoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final Color _warna = const Color.fromARGB(255, 32, 72, 142);
  final TextEditingController driver = TextEditingController();
  final TextEditingController sarana = TextEditingController();
  final TextEditingController penumpang = TextEditingController();
  final TextEditingController tglKeluar = TextEditingController();
  final TextEditingController jamKeluar = TextEditingController();
  final TextEditingController tglKembali = TextEditingController();
  final TextEditingController jamKembali = TextEditingController();
  final TextEditingController keperluan = TextEditingController();
  DateTime dt = DateTime.now();
  DateFormat fmt = DateFormat('dd MMMM yyyy');
  DateTime? tglHazard;
  DateTime? jamHazard;

  @override
  void initState() {
    tglHazard = dt;
    jamHazard =
        DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute, dt.second);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        title: const Text("Form Izin Sarana"),
        backgroundColor: _warna,
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
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blueGrey, Colors.lightBlueAccent]),
          ),
          child: formSarana(),
        ),
      ),
    );
  }

  Widget formSarana() {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: _warna, width: 2),
                            ),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: _warna, width: 2),
                            ),
                            labelText: "Sarana",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, color: _warna),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            fillColor: Colors.green,
                            hintText: 'Masukkan Sarana'),
                        controller: sarana,
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ListSarana(),
                            ),
                          );
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Sarana Tidak Boleh Kosong";
                          }
                          return null;
                        }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: _warna, width: 2),
                            ),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: _warna, width: 2),
                            ),
                            labelText: "Driver",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, color: _warna),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            fillColor: Colors.green,
                            hintText: 'Masukkan Driver'),
                        controller: driver,
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ListDriver(),
                            ),
                          );
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Driver Tidak Boleh Kosong";
                          }
                          return null;
                        }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: _warna, width: 2),
                            ),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: _warna, width: 2),
                            ),
                            labelText: "Penumpang",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, color: _warna),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            fillColor: Colors.green,
                            hintText: 'Masukkan Penumpang'),
                        controller: penumpang,
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ListPenumpang(),
                            ),
                          );
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Penumpang Tidak Boleh Kosong";
                          }
                          return null;
                        }),
                  ),
                ),
              ),
            ),
            formKeluar(),
            formKembali(),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 10,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    reverse: true,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          minLines: 6,
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: _warna, width: 2),
                              ),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: _warna, width: 2),
                              ),
                              labelText: "Keperluan",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, color: _warna),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              fillColor: Colors.white,
                              hintText: "Masukkan Keperluan"),
                          controller: keperluan,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Keperluan Tidak Boleh Kosong";
                            }
                            return null;
                          }),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: _warna,
                        ),
                        onPressed: () {},
                        child: const Text('SIMPAN'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red, elevation: 10),
                        onPressed: () {},
                        child: const Text('BATAL'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget formKeluar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: _warna, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: _warna, width: 2),
                      ),
                      labelText: "Tanggal Keluar",
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, color: _warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan Tanggal'),
                  controller: tglKeluar,
                  onTap: () async {
                    var tgl = await _selectDate(context, tglHazard!);
                    if (tgl != null) {
                      setState(() {
                        tglKeluar.text = fmt.format(tgl);
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: _warna, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: _warna, width: 2),
                      ),
                      labelText: "Jam Keluar",
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, color: _warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan Jam'),
                  controller: jamKeluar,
                  onTap: () async {
                    dt = DateTime.now();
                    jamHazard = dt;
                    var jam = await _seletTime(context, jamHazard!);
                    if (jam != null) {
                      setState(() {
                        jamKeluar.text =
                            "${jam.hour.toString().padLeft(2, '0')} : ${jam.minute.toString().padLeft(2, '0')}";
                      });
                    }
                  },
                  readOnly: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget formKembali() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: _warna, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: _warna, width: 2),
                      ),
                      labelText: "Tanggal Keluar",
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, color: _warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan Tanggal'),
                  controller: tglKembali,
                  onTap: () async {
                    var tgl = await _selectDate(context, tglHazard!);
                    if (tgl != null) {
                      setState(() {
                        tglKembali.text = fmt.format(tgl);
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: _warna, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: _warna, width: 2),
                      ),
                      labelText: "Jam Kembali",
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, color: _warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan Jam'),
                  controller: jamKembali,
                  onTap: () async {
                    dt = DateTime.now();
                    jamHazard = dt;
                    var jam = await _seletTime(context, jamHazard!);
                    if (jam != null) {
                      setState(() {
                        jamKembali.text =
                            "${jam.hour.toString().padLeft(2, '0')} : ${jam.minute.toString().padLeft(2, '0')}";
                      });
                    }
                  },
                  readOnly: true,
                ),
              ),
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

  Future<DateTime?> _seletTime(BuildContext context, DateTime jamHazard) async {
    return await DatePicker.showTimePicker(context,
        showTitleActions: true, currentTime: jamHazard);
  }
}
