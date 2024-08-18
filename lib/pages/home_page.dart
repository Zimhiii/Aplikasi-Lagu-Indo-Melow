import 'package:flutter/material.dart';
import 'package:appp_lagu_indo_melow/models/lagu.dart';
import 'package:appp_lagu_indo_melow/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lagu Indonesia Melow By Hizba",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 9, 189),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(lagu: listLaguMelow[index]);
              }));
            },
            child: Card(
              color: const Color.fromARGB(255, 0, 0, 245),
              margin: const EdgeInsets.all(10),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Mengatur radius sudut
                side: const BorderSide(
                  color: Color.fromARGB(255, 0, 55, 255), // Warna border
                  width: 1.0, // Ketebalan border
                ),
              ),
              child: ListTile(
                title: Text(
                  listLaguMelow[index].judul,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  listLaguMelow[index].pencipta,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
                leading: Image.network(listLaguMelow[index].foto),
              ),
            ),
          );
        },
        itemCount: listLaguMelow.length,
      ),
    );
  }
}
