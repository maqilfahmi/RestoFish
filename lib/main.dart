import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'Rumah Makan Fish Kord';
    biodata['email'] = 'maqilf@gmail.com';
    biodata['phone'] = '082192382991';
    biodata['image'] = 'resto.jpg';
    biodata['buka'] = '    07.00 - 23.00';
    biodata['list'] = '''    - Lele goreng
    - Kakap Bakar
    - Bawal Goreng''';
    biodata['addr'] = '     Jl. Pattimura Timur IV no 4';
    biodata['desc'] =
        '''Rumah Makan Fish Kord merupakan rumah makan yang paling pertama didirikan, yaitu sejak tahun 1922. Rasa masakan di rumah makan ini sudah terverifikasi enak dan harganya pun juga terjangkau... Jangan lupa mampir kawan kawan ''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rm. Fish Kord",
      home: Scaffold(
        appBar: AppBar(title: const Text("Rm. Fish Kord")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            teksKotak(Colors.black, biodata['name'] ?? ''),
            Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
            SizedBox(height: 10),
            Row(
              children: [
                btnContact(Icons.mark_email_unread_rounded, Colors.blueAccent,
                    "mailto: ${biodata['email']}"),
                btnContact(Icons.phone, Colors.deepPurple,
                    "https://wa.me/${biodata['phone']}"),
                btnContact(Icons.map_sharp, Colors.green[900],
                    "https://maps.app.goo.gl/bgCdTwiZoLK8yMau9"),
              ],
            ),
            SizedBox(height: 10),
            teksKotak(Colors.black38, 'Deskripsi'),
            Text(biodata['desc'] ?? '', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            textAttribute("List Menu", biodata['list'] ?? ''),
            textAttribute("Alamat", biodata['addr'] ?? ''),
            textAttribute("Jam Buka", biodata['buka'] ?? ''),
            SizedBox(height: 10),
          ]),
        ),
      ),
    );
  }

  Container teksKotak(Color backgroundColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: backgroundColor),
      child: Text(
        teks,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
      children: [
        Container(
            width: 100,
            child: Text("- $judul",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
        Text(":", style: TextStyle(fontSize: 20)),
        Text(teks, style: TextStyle(fontSize: 20)),
      ],
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            launch(uri);
          },
          child: Icon(icon),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }

  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}
