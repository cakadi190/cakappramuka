import 'package:cakappramuka/config/colors.dart';
import 'package:cakappramuka/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Apakah Kakak Yakin?'),
            content: Text('Apakah kakak yakin akan keluar dari aplikasi?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Batal'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('Iya'),
              ),
            ],
          ),
        )) ??
        false;
  }

  void _navigateToHome() async {
    await Future.delayed(
        Duration(milliseconds: 5000),
        () => Navigator.of(context).pushAndRemoveUntil(
            PageTransition(
                type: PageTransitionType.rightToLeft, child: Homepage()),
            (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarColor: ThemeColors.primary),
        child: WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
                body: Center(
                    child: Container(
                        padding: EdgeInsets.all(36),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icon.png'),
                            SizedBox(height: 16),
                            Text('Sedang Memuat...',
                                style: GoogleFonts.signika(fontSize: 18)),
                            SizedBox(height: 8),
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color?>(
                                  Theme.of(context)
                                      .primaryColor
                                      .withOpacity(1.0)),
                              backgroundColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                            )
                          ],
                        ))))));
  }
}
