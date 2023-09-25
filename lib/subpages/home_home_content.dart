import 'package:cakappramuka/config/colors.dart';
import 'package:flutter/material.dart';

import 'package:cakappramuka/components/home_slider.dart';
import 'package:cakappramuka/components/home_basicscouting.dart';
import 'package:cakappramuka/components/home_advancescouting.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeContent extends StatefulWidget {
  HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarColor: ThemeColors.primary),
        child: Scaffold(
            body: SingleChildScrollView(
                child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          padding: EdgeInsets.only(top: 40, bottom: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat datang kembali kak...",
                    style: GoogleFonts.signika(fontSize: 16),
                  ),
                  Text(
                    "Salam Pramuka!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16),
              HomeSlider(),
              SizedBox(height: 20),
              BasicScout(),
              SizedBox(height: 16),
              AdvancedScout(),
            ],
          ),
        ))));
  }
}
