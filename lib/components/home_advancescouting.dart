import 'package:cakappramuka/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvancedScout extends StatefulWidget {
  AdvancedScout({super.key});

  @override
  State<AdvancedScout> createState() => _AdvancedScoutState();
}

class _AdvancedScoutState extends State<AdvancedScout> {
  static var _listPage = <Map<String, dynamic>>[
    {"title": "Kepanduan Umum"},
    {"title": "Simpul"},
    {"title": "Yel-Yel dan Video Lengkap"},
    {"title": "Sandi"},
    {"title": "Perkemahan"},
    {"title": "Satuan Karya (SAKA)"},
    {"title": "P3K"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Kepramukaan Dasar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 13 / 6,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: _listPage.length,
              itemBuilder: (BuildContext ctx, index) {
                Map<String, dynamic> data = _listPage[index];

                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['title'], textAlign: TextAlign.center)
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
