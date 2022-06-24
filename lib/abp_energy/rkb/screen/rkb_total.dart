import 'package:face_id_plus/abp_energy/rkb/screen/detail_rkb.dart';
import 'package:flutter/material.dart';

class TotalRKB extends StatefulWidget {
  const TotalRKB({Key? key}) : super(key: key);

  @override
  State<TotalRKB> createState() => _TotalRKBState();
}

class _TotalRKBState extends State<TotalRKB> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 72, 142),
        title: const Text("Rencana Kebutuhan Barang"),
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
      bottomNavigationBar: bottomNavigator(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: totalRKB(),
      ),
    );
  }

  Widget totalRKB() {
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          height: 340,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const DetailRKB(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 20,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 32, 72, 142),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "00153/ABP/RKB/LOGISTIC/2022",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "28 Mei 2022",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 91, 90, 90),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "HENDRA",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 91, 90, 90),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "HCGA & EXTERNAL - LOGISTIC",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 91, 90, 90),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("Kabag"),
                        Text("KTT"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        SizedBox(
                          height: 30,
                          child: Card(
                            elevation: 20,
                            color: Colors.green,
                            child: Center(
                                child: Text(
                              "17:26:01. 28 Mei 2022",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Card(
                            elevation: 20,
                            color: Colors.green,
                            child: Center(
                                child: Text(
                              "17:26:01. 28 Mei 2022",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget bottomNavigator() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage("assets/images/doc.png"),
            width: 35,
            height: 35,
          ),
          activeIcon: Image(
            image: AssetImage("assets/images/docs_hover.png"),
            width: 35,
            height: 35,
          ),
          label: 'TOTAL',
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage("assets/images/doc_appr.png"),
            width: 35,
            height: 35,
          ),
          activeIcon: Image(
            image: AssetImage("assets/images/docs_appr_hover.png"),
            width: 35,
            height: 35,
          ),
          label: 'APPROVE',
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage("assets/images/docs_wait.png"),
            width: 35,
            height: 35,
          ),
          activeIcon: Image(
            image: AssetImage("assets/images/docs_wait_hover.png"),
            width: 35,
            height: 35,
          ),
          label: 'WAITING',
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage("assets/images/docs_cancel.png"),
            width: 35,
            height: 35,
          ),
          activeIcon: Image(
            image: AssetImage("assets/images/docs_cancel_hover.png"),
            width: 35,
            height: 35,
          ),
          label: 'CANCEL',
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage("assets/images/docs_arciv.png"),
            width: 35,
            height: 35,
          ),
          activeIcon: Image(
            image: AssetImage("assets/images/docs_arciv_hover.png"),
            width: 35,
            height: 35,
          ),
          label: 'CLOSE',
        ),
      ],
      currentIndex: _selectedNavbar,
      backgroundColor: Color.fromARGB(255, 11, 93, 156),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      showUnselectedLabels: true,
      onTap: _changeSelectedNavBar,
    );
  }
}
