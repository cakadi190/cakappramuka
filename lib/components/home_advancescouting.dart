import 'package:flutter/cupertino.dart';

class AdvancedScout extends StatefulWidget {
  AdvancedScout({super.key});

  @override
  State<AdvancedScout> createState() => _AdvancedScoutState();
}

class _AdvancedScoutState extends State<AdvancedScout> {
  @override
  Widget build(BuildContext context) {
    return Text('Kepramukaan Lanjutan',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
  }
}
