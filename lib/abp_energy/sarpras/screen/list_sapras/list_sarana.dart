import 'package:flutter/material.dart';

class ListSarana extends StatefulWidget {
  const ListSarana({ Key? key }) : super(key: key);

  @override
  State<ListSarana> createState() => _ListSaranaState();
}

class _ListSaranaState extends State<ListSarana> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Sarana"),
      ),
    );
  }
}