import 'package:cakappramuka/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportBugContent extends StatefulWidget {
  ReportBugContent({super.key});

  @override
  State<ReportBugContent> createState() => _ReportBugContentState();
}

class _ReportBugContentState extends State<ReportBugContent> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title:
            Text('Laporkan Kesalahan', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                  "Halo kak, silahkan kirimkan laporan kakak disini ya! Jangan lupa isikan pada kolom yang diperlukan supaya bisa dikirim pelaporannya.",
                  style: GoogleFonts.signika(fontSize: 16)),
              SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: GoogleFonts.signika(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        hintText: 'Agus Santoso (tanpa tulisan kakak)',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Harap diisi dulu.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Surat Elektronik',
                        hintText: 'email@kakak.tld',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Harap diisi dulu.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nomor Whatsapp (Opsional)',
                        hintText: '+6281234567890',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Judul Laporan',
                        hintText: 'Ada Terjemahan Yang Tidak Sesuai',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Harap diisi dulu.';
                        }
                        return null;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Penjelasan Masalahnya',
                        hintText:
                            'Mohon segera diperbaiki, ada terjemahan yang masih belum sesuai dengan EYD kak di bagian E-Book.',
                      ),
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: ThemeColors.primary,
                        elevation: 0,
                        shadowColor: ThemeColors.primary[700],
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Mengirimkan')),
                          );
                        }
                      },
                      child: Text('Kirimkan Laporan'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
