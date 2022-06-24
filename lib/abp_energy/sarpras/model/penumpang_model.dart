// ignore_for_file: unnecessary_this, prefer_void_to_null, unnecessary_new, prefer_collection_literals, unnecessary_question_mark, duplicate_ignore

class ApiPenumpang {
  bool? success;
  Penumpang? listPenumpang;

  ApiPenumpang({this.success, this.listPenumpang});

  factory ApiPenumpang.fromJson(Map<String,dynamic> object) {
    return ApiPenumpang(
      success: object["success"], 
      listPenumpang: (object["list_penumpang"] != null) ? Penumpang.fromJson(object["list_penumpang"]) : null 
    );
  }
}

class Penumpang {
  int? current_page;
  List<DataPenumpang>? data;
  int? from;
  int? last_page;
  String? next_page_url;
  String? path;
  int? per_page;
  int? to;
  int? total;
  String? prev_page_url;

  Penumpang({
    this.current_page,
    this.data,
    this.from,
    this.last_page,
    this.path,
    this.next_page_url,
    this.per_page,
    this.to,
    this.total,
    this.prev_page_url,
  });

  factory Penumpang.fromJson(Map<String, dynamic> objek) {
    return Penumpang(
      current_page: objek["current_page"],
      data:(objek['data'] != null) ? (objek["data"] as List).map((b) => DataPenumpang.fromJson(b)).toList() : [],
      from: objek["from"],
      last_page: objek["last_page"],
      path: objek["path"],
      next_page_url: objek["next_page_url"],
      per_page: objek["per_page"],
      to: objek["to"],
      total: objek["total"],
      prev_page_url: objek["prev_page_url"],
    );
  }
}

class DataPenumpang {
  String? nik;
  String? nama;
  String? department;
  String? section;
  String? jabatan;
  String? flag;
  String? userEntry;
  String? tanggalEntry;

  DataPenumpang(
      {this.nik,
      this.nama,
      this.department,
      this.section,
      this.jabatan,
      this.flag,
      this.userEntry,
      this.tanggalEntry});

  DataPenumpang.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    department = json['department'];
    section = json['section'];
    jabatan = json['jabatan'];
    flag = json['flag'];
    userEntry = json['user_entry'];
    tanggalEntry = json['tanggal_entry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nik'] = this.nik;
    data['nama'] = this.nama;
    data['department'] = this.department;
    data['section'] = this.section;
    data['jabatan'] = this.jabatan;
    data['flag'] = this.flag;
    data['user_entry'] = this.userEntry;
    data['tanggal_entry'] = this.tanggalEntry;
    return data;
  }
}
