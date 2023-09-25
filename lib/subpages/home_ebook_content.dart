import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EbookContent extends StatefulWidget {
  EbookContent({super.key});

  @override
  State<EbookContent> createState() => _EbookContentState();
}

class _EbookContentState extends State<EbookContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Buku Digital', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
                "Disini kakak-kakak dapat membaca semua materi kepramukaan dari perpustakaan mini gratis ini. Namun perlu diingat, kakak harus mengaktifkan internet atau harus terhubung ke jaringan internet dahulu karena buku yang tersedia hanya dapat diakses dengan internet.",
                style: GoogleFonts.signika(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
