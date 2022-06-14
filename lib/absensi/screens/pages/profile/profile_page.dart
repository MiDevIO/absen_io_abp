import 'dart:io';
import 'package:face_id_plus/absensi/model/face_login_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int? isLogin = 0;
  late String nama;
  late String nik;
  XFile? _foto;

  var imagePicker = ImagePicker();
  Future getImageGallery() async {
    var imageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      _foto = imageFile;
    });
  }

  Future getImageCamera() async {
    var imageFile = await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _foto = imageFile;
    });
  }

  @override
  void initState() {
    _getPref();
    nik = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: _topContent());
  }

  Widget _topContent() {
    return FutureBuilder(
        future: _getPref(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              Datalogin fUsers = Datalogin();
              fUsers = snapshot.data;
              nik = fUsers.nik!;
              return Stack(
                children: [
                  SizedBox(
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Card(
                        margin: const EdgeInsets.only(top: 100),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 90.0),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.person),
                                    title: Text("${fUsers.nama}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  ListTile(
                                    leading:
                                        const Icon(Icons.format_list_numbered),
                                    title: Text("${fUsers.nik}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                        Icons.business_center_rounded),
                                    title: Text("${fUsers.devisi}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      margin: const EdgeInsets.only(top: 40),
                      elevation: 18,
                      shape: const CircleBorder(),
                      child: SizedBox(
                        width: 179,
                        height: 179,
                        child: Center(
                          child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        elevation: 16,
                                        child: SizedBox(
                                          height: 230,
                                          width: 400,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Image.asset(
                                                    "assets/images/dev.png",
                                                    height: 100,
                                                    width: 100),
                                              ),
                                              const SizedBox(height: 20),
                                              const Text(
                                                "Fitur Belum Tersedia",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                  "Maaf, fitur sedang dalam tahap pengembangan")
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: (_foto == null)
                                  ? const Icon(Icons.add_a_photo, size: 50)
                                  : Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(200),
                                          child: Image.file(
                                            File(_foto!.path),
                                            fit: BoxFit.fill,
                                            width: 200,
                                            height: 200,
                                          )),
                                    )),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        });
  }

  Future<Datalogin> _getPref() async {
    Datalogin _users = Datalogin();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    nama = _pref.getString("nama").toString();
    String nik = _pref.getString("nik").toString();
    String devisi = _pref.getString("devisi").toString();
    int? _showAbsen = _pref.getInt("show_absen");
    _users.nama = nama;
    _users.nik = nik;
    _users.devisi = devisi;
    if (kDebugMode) {
      print("showAbsen $_showAbsen");
    }

    _users.showAbsen = (_showAbsen == null) ? 0 : _showAbsen;

    return _users;
  }
}
