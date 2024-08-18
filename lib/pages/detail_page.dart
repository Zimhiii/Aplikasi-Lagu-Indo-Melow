// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:appp_lagu_indo_melow/models/lagu.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Lagu lagu;
  const DetailPage({
    super.key,
    required this.lagu,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.lagu.judul,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 9, 189),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 2, 5, 233),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    color: const Color.fromARGB(255, 255, 255, 255), width: 1)),
            child: Text(
              '${widget.lagu.pencipta} - ${widget.lagu.judul}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),

          Image.network(widget.lagu.foto, height: 200),
          // Container(
          //   margin: const EdgeInsets.all(5),
          //   child: ElevatedButton(
          //     onPressed: () async {
          //       await openUrl(widget.lagu.linkYt);
          //     },
          //     style: ButtonStyle(
          //       backgroundColor: WidgetStateProperty.all<Color>(
          //         const Color.fromARGB(255, 2, 5, 233),
          //       ), // Mengatur warna latar belakang
          //       shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(
          //               10.0), // Mengatur border radius menjadi 5
          //         ),
          //       ),
          //     ),
          //     child: const Text(
          //       'BUKA YOUTUBE',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.all(5),
            child: LaunchButton('Youtube', () async {
              await openUrl(widget.lagu.linkYt);
            }),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 2, 5, 233),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 1)),
              child: Text(
                widget.lagu.lirikLagu,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
              )),
        ],
      ),
    );
  }
}

class LaunchButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap; // Menggunakan VoidCallback untuk tipe onTap

  const LaunchButton(this.text, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            const Color.fromARGB(255, 2, 5, 233),
          ), // Mengatur warna latar belakang
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10.0), // Mengatur border radius menjadi 5
            ),
          ),
        ), // Memanggil onTap langsung
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

Future<void> openUrl(String url,
    {bool forceWebview = false, bool enableJavaScript = false}) async {
  // ignore: deprecated_member_use
  await launch(url);
}

// Future<void> openUrl(String url,
//     {bool forceWebview = false, bool enableJavaScript = false}) async {
//   // ignore: deprecated_member_use
//   if (await canLaunch(url)) {
//     // ignore: deprecated_member_use
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
