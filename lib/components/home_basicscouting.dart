import 'package:flutter/cupertino.dart';

class BasicScout extends StatefulWidget {
  BasicScout({super.key});

  @override
  State<BasicScout> createState() => _BasicScoutState();
}

class _BasicScoutState extends State<BasicScout> {
  @override
  Widget build(BuildContext context) {
    return Text('Kepramukaan Dasar',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
  }
}
