import 'package:cakappramuka/config/colors.dart';
import 'package:cakappramuka/pages/license.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:remixicon/remixicon.dart';
import 'package:cakappramuka/helper/helper.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutContent extends StatefulWidget {
  AboutContent({Key? key}) : super(key: key);

  @override
  State<AboutContent> createState() => _AboutContentState();
}

class _AboutContentState extends State<AboutContent> {
  final scaffoldRef = GlobalKey<ScaffoldMessengerState>();
  String? _appVersion;
  String? _appName;

  @override
  void initState() {
    super.initState();
    _initGetterAppVersion();
  }

  InlineSpan buildContactInfo(BuildContext context, String label, String url,
      {bool last = false}) {
    return TextSpan(
      // text: label,
      style: DefaultTextStyle.of(context).style.merge(TextStyle(fontSize: 16)),
      children: [
        WidgetSpan(child: SizedBox(width: 4)),
        last ? TextSpan(text: 'dan') : TextSpan(text: ''),
        last ? WidgetSpan(child: SizedBox(width: 4)) : TextSpan(text: ''),
        TextSpan(
          text: label,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Helper.openUrl(url);
            },
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        last ? WidgetSpan(child: SizedBox(width: 4)) : TextSpan(text: ','),
      ],
    );
  }

  final List<Map<String, dynamic>> accountName = [
    {
      "bank": "assets/images/account-bank/gojek.png",
      "provider": "PT Dompet Anak Bangsa (Gopay)",
      "number": "081333550746"
    },
    {
      "bank": "assets/images/account-bank/jago.png",
      "provider": "PT Bank Jago Tbk. (Jago)",
      "number": "5021 6999 3411"
    },
    {
      "bank": "assets/images/account-bank/bca.png",
      "provider": "PT Bank Central Asia Tbk. (BCA)",
      "number": "0092188343"
    },
  ];

  Future<void> _initGetterAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
      _appName = packageInfo.appName;
    });
  }

  Widget DonateSection() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: accountName.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> data = accountName[index];
          return ListTile(
              onTap: () {
                Clipboard.setData(ClipboardData(text: data['number']));
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  action: SnackBarAction(
                    label: 'Tutup',
                    textColor: Colors.white.withOpacity(0.75),
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    },
                  ),
                  content: Text(
                    "Nomor rekening telah disalin ke papan salinan.",
                    style: GoogleFonts.signika(fontSize: 16),
                  ),
                ));
              },
              onLongPress: () {
                Clipboard.setData(ClipboardData(text: data['number']));
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  action: SnackBarAction(
                    textColor: Colors.white.withOpacity(0.75),
                    label: 'Tutup',
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    },
                  ),
                  content: Text(
                    "Nomor rekening telah disalin ke papan salinan.",
                    style: GoogleFonts.signika(fontSize: 16),
                  ),
                ));
              },
            title: Text(data['number'], style: GoogleFonts.signika(fontWeight: FontWeight.bold, color: ThemeColors.primary)),
            subtitle: Text('a/n Amir Zuhdi Wibowo', style: GoogleFonts.signika(fontWeight: FontWeight.normal, color: ThemeColors.primary)),
            trailing: Image.asset(data['bank'], height: 24),
          );
        });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldRef,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Tentang Aplikasi', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            // height: 300,
            padding: EdgeInsets.only(top: 24, bottom: 48, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(999),
                  bottomRight: Radius.circular(999)),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icon.png',
                    height: 156,
                  ),
                  SizedBox(height: 16),
                  Text("${_appName}",
                      style: GoogleFonts.signika(
                          fontSize: 24, color: ThemeColors.primary[100])),
                  Text('v${_appVersion}',
                      style: GoogleFonts.signika(
                          fontSize: 14, color: ThemeColors.primary[200])),
                  SizedBox(height: 16),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: ThemeColors.primary,
                          backgroundColor: ThemeColors.primary[100],
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          shadowColor: Colors.orange,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: LicensesPage()));
                        },
                        child: Text('Lisensi'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: ThemeColors.primary,
                          backgroundColor: ThemeColors.primary[100],
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          shadowColor: Colors.orange,
                        ),
                        onPressed: () {
                          Helper.openUrl('https://trakteer.id/cakadi190');
                        },
                        child: Text('Donasi'),
                      ),
                    ],
                  ))
                ]),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text:
                        "Aplikasi ini adalah aplikasi untuk memudahkan adik-adik, teman-teman atau kakak-kakak untuk mempelajari, melatih dan mempraktekan ilmu kepramukaan dimanapun kakak berada yang mana hadir dalam bentuk aplikasi mobile untuk android dan iOS.",
                    style: DefaultTextStyle.of(context)
                        .style
                        .merge(TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text:
                        "Nah, apabila kakak, teman-teman atau adik-adik berminat atau berkenan untuk membantu saya dalam pendanaan, pengembangan dan riset aplikasi ini bisa menghubungi saya melalui",
                    style: DefaultTextStyle.of(context)
                        .style
                        .merge(TextStyle(fontSize: 16)),
                    children: [
                      buildContactInfo(
                          context, 'Whatsapp', 'https://wa.me/6281333550746'),
                      buildContactInfo(
                          context, 'Email', 'mailto:cakadi190@gmail.com'),
                      buildContactInfo(
                          context, 'Facebook', 'https://fb.me/cakadi190'),
                      buildContactInfo(context, 'Instagram',
                          'https://instagram.com/cakadi190',
                          last: true),
                      TextSpan(
                          text:
                              'pribadi saya untuk mendapatkan akses dan izin.'),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text:
                        "Oh iya, saya lupa satu hal. Apabila kakak-kakak, adik-adik atau teman-teman menemukan kejanggalan (baik berupa penulisan, ejaan, sumber dan lainnya) bisa langsung menekan tombol berikon \"Tanda Seru\" dan isikan pelaporannya.",
                    style: DefaultTextStyle.of(context)
                        .style
                        .merge(TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ThemeColors.primary.withOpacity(0.125),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 96,
                          height: 96,
                          child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/mine.jpg',
                                ),
                              ))),
                      Text('Tentang Pengembang Aplikasi',
                          style: GoogleFonts.signika(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                      Text(
                          'Halo rek! Kenalin namaku Amir Zuhdi Wibowo yang bisa dan biasa dipanggil "Cak Adi" yang mana saya adalah seorang fullstack web developer dan sekarang bekerja di PT Buat Usaha Digital Indonesia.',
                          style: GoogleFonts.signika(fontSize: 16),
                          textAlign: TextAlign.center),
                      SizedBox(height: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Ikuti Saya Di',
                              style: GoogleFonts.signika(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Remix.facebook_box_fill),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF4267B2)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color?>(
                                            Colors.white)),
                                onPressed: () =>
                                    Helper.openUrl('https://fb.me/cakadi190'),
                              ),
                              IconButton(
                                icon: Icon(Remix.youtube_fill),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFFFF0000)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color?>(
                                            Colors.white)),
                                onPressed: () => Helper.openUrl(
                                    'https://youtube.com/@catatancakadi'),
                              ),
                              IconButton(
                                icon: Icon(Remix.whatsapp_fill),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF25D366)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color?>(
                                            Colors.white)),
                                onPressed: () =>
                                    Helper.openUrl('https://wa.me/6281333550746'),
                              ),
                              IconButton(
                                icon: Icon(Remix.github_fill),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF333333)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color?>(
                                            Colors.white)),
                                onPressed: () =>
                                    Helper.openUrl('https://github.com/cakadi190'),
                              ),
                              IconButton(
                                icon: Icon(Remix.instagram_line),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFFE1306C)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color?>(
                                            Colors.white)),
                                onPressed: () =>
                                    Helper.openUrl('https://instagram.com/cakadi190'),
                              ),
                              IconButton(
                                icon: Icon(Remix.linkedin_box_fill),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF0077b5)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color?>(
                                            Colors.white)),
                                onPressed: () => Helper.openUrl(
                                    'https://linkedin.com/in/cakadi190'),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text("Dukung Pengembang (opsional)",
                    style: GoogleFonts.signika(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                Text(
                    "Yuk dukung saya untuk membangun aplikasi ini lebih baik dengan cara berdonasi ke nomor rekening dibawah ini.",
                    style: GoogleFonts.signika(
                        fontWeight: FontWeight.normal, fontSize: 16)),
                SizedBox(height: 4),
                DonateSection(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
