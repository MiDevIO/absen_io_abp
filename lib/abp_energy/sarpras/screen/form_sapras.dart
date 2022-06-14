import 'package:face_id_plus/abp_energy/sarpras/screen/list_sapras/list_driver.dart';
import 'package:face_id_plus/abp_energy/sarpras/screen/list_sapras/list_penumpang.dart';
import 'package:face_id_plus/abp_energy/sarpras/screen/list_sapras/list_sarana.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        title: const Text("Form Izin Sarana"),
        backgroundColor: _warna,
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
                            labelStyle: TextStyle(fontWeight: FontWeight.bold, color: _warna),
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
                            labelStyle: TextStyle(fontWeight: FontWeight.bold, color: _warna),
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
                            labelStyle: TextStyle(fontWeight: FontWeight.bold, color: _warna),
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
                          cursorColor: Theme.of(context).cursorColor,
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
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: _warna),
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
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: _warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan Tanggal'),
                  controller: tglKeluar,
                  onTap: () async {
                    DateTime? date;
                    FocusScope.of(context).requestFocus(FocusNode());
                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    var _tanggal = "${date!.day}-${date.month}-${date.year}";
                    tglKeluar.text = _tanggal;
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
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: _warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan Jam'),
                  controller: jamKeluar,
                  onTap: () async {
                    TimeOfDay? pickedTime;
                    pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (pickedTime != null) {
                      print(pickedTime.format(context));
                      DateTime parsedTime = DateFormat.jm()
                          .parse(pickedTime.format(context).toString());
                      String formattedTime =
                          DateFormat('HH:mm a').format(parsedTime);
                      setState(() {
                        jamKeluar.text = formattedTime;
                      });
                    } else {
                      print("Time is not selected");
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
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: _warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan Tanggal'),
                  controller: tglKembali,
                  onTap: () async {
                    DateTime? date;
                    FocusScope.of(context).requestFocus(FocusNode());
                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    var _tanggal = "${date!.day}-${date.month}-${date.year}";
                    tglKembali.text = _tanggal;
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
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: _warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan Jam'),
                  controller: jamKembali,
                  onTap: () async {
                    TimeOfDay? pickedTime;
                    pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (pickedTime != null) {
                      print(pickedTime.format(context));
                      DateTime parsedTime = DateFormat.jm()
                          .parse(pickedTime.format(context).toString());
                      String formattedTime =
                          DateFormat('HH:mm a').format(parsedTime);
                      setState(() {
                        jamKembali.text = formattedTime;
                      });
                    } else {
                      print("Time is not selected");
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
}
