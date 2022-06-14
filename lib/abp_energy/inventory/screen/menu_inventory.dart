import 'package:face_id_plus/abp_energy/inventory/screen/stock.dart';
import 'package:flutter/material.dart';

class MenuInventory extends StatefulWidget {
  const MenuInventory({ Key? key }) : super(key: key);

  @override
  State<MenuInventory> createState() => _MenuInventoryState();
}

class _MenuInventoryState extends State<MenuInventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 72, 142),
        title: const Text("Menu Inventory"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: menuGrid(),
      ),
    );
  }

  Widget menuGrid() {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40, top: 20),
      child: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Stock(),
                  ),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/icon_stock.png",
                      width: 200,
                      height: 100,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "STOCK",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}