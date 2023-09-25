import 'package:flutter/material.dart';

class PramukaPandegaPage extends StatefulWidget {
  PramukaPandegaPage({super.key});

  @override
  State<PramukaPandegaPage> createState() => _PramukaPandegaPageState();
}

class _PramukaPandegaPageState extends State<PramukaPandegaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Materi Pandega', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text('Pramuka Pandega'),
        ),
      ),
    );
  }
}
