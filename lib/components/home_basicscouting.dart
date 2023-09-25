import 'package:cakappramuka/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicScout extends StatefulWidget {
  BasicScout({super.key});

  @override
  State<BasicScout> createState() => _BasicScoutState();
}

class _BasicScoutState extends State<BasicScout> {
  static var _listPage = <Map<String, dynamic>>[
    {"title": "Kepanduan Umum"},
    {"title": "Simpul"},
    {"title": "Yel-Yel dan Video Lengkap"},
    {"title": "Sandi"},
    {"title": "Perkemahan"},
    {"title": "Satuan Karya (SAKA)"},
    {"title": "P3K"},
    {"title": "Bedah SKU"},
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
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16),
              itemCount: _listPage.length,
              itemBuilder: (BuildContext ctx, index) {
                Map<String, dynamic> data = _listPage[index];

                return InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Tap'),
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: ThemeColors.primary.shade200,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data['title'], textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
