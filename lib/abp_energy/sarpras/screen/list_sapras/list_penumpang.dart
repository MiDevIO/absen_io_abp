import 'package:flutter/material.dart';

class ListPenumpang extends StatefulWidget {
  const ListPenumpang({ Key? key }) : super(key: key);

  @override
  State<ListPenumpang> createState() => _ListPenumpangState();
}

class _ListPenumpangState extends State<ListPenumpang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Penumpang'),
      ),
    );
  }
}