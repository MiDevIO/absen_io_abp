import 'package:flutter/material.dart';

class Stock extends StatefulWidget {
  const Stock({Key? key}) : super(key: key);

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 72, 142),
        title: const Text("Stock Inventory"),
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
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //       begin: Alignment.topRight,
        //       end: Alignment.bottomLeft,
        //       colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        // ),
        child: expand(),
      ),
    );
  }

  Widget expand() {
    return ListView(
      children: [
        ExpansionTile(
          backgroundColor: Colors.white,
          title: stockList(),
          trailing: const SizedBox(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock In June"),
                  Spacer(),
                  Text("0 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock Out June"),
                  Spacer(),
                  Text("15 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock In"),
                  Spacer(),
                  Text("450 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock Out"),
                  Spacer(),
                  Text("407 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock"),
                  Spacer(),
                  Text("43 PASANG"),
                ],
              ),
            ),
          ],
        ),
        ExpansionTile(
          backgroundColor: Colors.white,
          title: stockList(),
          trailing: SizedBox(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock In June"),
                  Spacer(),
                  Text("0 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock Out June"),
                  Spacer(),
                  Text("15 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock In"),
                  Spacer(),
                  Text("450 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock Out"),
                  Spacer(),
                  Text("407 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock"),
                  Spacer(),
                  Text("43 PASANG"),
                ],
              ),
            ),
          ],
        ),
        ExpansionTile(
          backgroundColor: Colors.white,
          title: stockList(),
          trailing: SizedBox(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock In June"),
                  Spacer(),
                  Text("0 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock Out June"),
                  Spacer(),
                  Text("15 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock In"),
                  Spacer(),
                  Text("450 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock Out"),
                  Spacer(),
                  Text("407 PASANG"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("Stock"),
                  Spacer(),
                  Text("43 PASANG"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget stockList() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Barang",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text("(00000128) BATERAI ALKALINE AA / A2 "),
          ],
        ),
      ],
    );
  }
}
