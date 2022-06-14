import 'package:flutter/material.dart';

class ListDriver extends StatefulWidget {
  const ListDriver({ Key? key }) : super(key: key);

  @override
  State<ListDriver> createState() => _ListDriverState();
}

class _ListDriverState extends State<ListDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Driver'),
      ),
    );
  }
}