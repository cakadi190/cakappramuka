import 'package:flutter/material.dart';

class PramukaSiagaPage extends StatefulWidget {
  PramukaSiagaPage({super.key});

  @override
  State<PramukaSiagaPage> createState() => _PramukaSiagaPageState();
}

class _PramukaSiagaPageState extends State<PramukaSiagaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text('Materi Siaga', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text('Pramuka Siaga'),
        ),
      ),
    );
  }
}
