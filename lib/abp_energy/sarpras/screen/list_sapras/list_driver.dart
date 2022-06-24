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
    );
  }
}