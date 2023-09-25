import 'package:flutter/material.dart';

class PramukaPenegakPage extends StatefulWidget {
  PramukaPenegakPage({super.key});

  @override
  State<PramukaPenegakPage> createState() => _PramukaPenegakPageState();
}

class _PramukaPenegakPageState extends State<PramukaPenegakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Materi Penegak', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text('Pramuka Penegak'),
        ),
      ),
    );
  }
}
