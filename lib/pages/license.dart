import 'dart:io';
import 'package:cakappramuka/config/colors.dart';
import 'package:cakappramuka/helper/internet.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(LicensesPage());

class LicensesPage extends StatefulWidget {
  LicensesPage({super.key});

  @override
  State<LicensesPage> createState() => _LicensesPageState();
}

class _LicensesPageState extends State<LicensesPage> {
  Map _source = {ConnectivityResult.none: false};
  final ConnectStatus _connectivity = ConnectStatus.instance;

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  final List<Map<String, dynamic>> _licenseList = [
    {
      'title': 'Hand drawn pramuka day illustration',
      'author': "Freepik",
      'url':
          'https://www.freepik.com/free-vector/hand-drawn-pramuka-day-illustration_16133498.htm#query=pramuka&position=27&from_view=search&track=sph'
    },
    {
      'title': '5 Pramuka Pandega UIN Jakarta Raih Prestasi Pramuka Garuda',
      'author': "Pramuka UIN Jakarta",
      'url':
          'https://www.uinjkt.ac.id/5-pramuka-pandega-uin-jakarta-raih-prestasi-pramuka-garuda/'
    },
    {
      'title': 'Foto Cover Pramuka Garuda',
      'author': "Inspirasi Guru",
      'url':
          'https://inspirasiguru.com/post/berikut-penjelasan-jika-anda-ingin-mendapat-gelar-pramuka-garuda/'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:
            Text('Lisensi dan Kredit', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
                'Terima kasih kepada semuanya yang sudah membantu dalam pengembangan aplikasi ini, termasuk yang ada dalam daftar berikut ini.',
                style: GoogleFonts.signika(fontSize: 16)),
            SizedBox(height: 16),
            Text("Atribusi & Kredit",
                style: GoogleFonts.signika(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _licenseList.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> license = _licenseList[index];
                return ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  subtitle: Text("By ${license['author']}",
                      style: GoogleFonts.signika(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ThemeColors.primary.shade400)),
                  title: Text(
                    license['title'],
                    style: GoogleFonts.signika(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: ThemeColors.primary),
                  ),
                  onTap: () {
                    if (_source.keys.toList()[0] != ConnectivityResult.none) {
                      _openUrl(license['url']);
                    } else {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Maaf, tidak ada koneksi internet'),
                        action: SnackBarAction(
                          label: 'Tutup',
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
                          },
                        ),
                      ));
                    }
                  },
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
