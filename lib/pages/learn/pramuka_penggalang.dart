import 'package:flutter/material.dart';

class PramukaPenggalangPage extends StatefulWidget {
  PramukaPenggalangPage({super.key});

  @override
  State<PramukaPenggalangPage> createState() => _PramukaPenggalangPageState();
}

class _PramukaPenggalangPageState extends State<PramukaPenggalangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Materi Penggalang', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text('Pramuka Penggalang'),
        ),
      ),
    );
  }
}
