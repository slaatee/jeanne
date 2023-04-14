import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeanneetjean/mag/magas.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../drawer.dart';

class MyMag extends StatefulWidget {
  const MyMag({Key? key}) : super(key: key);
  static const String route = '/magasin';
  @override
  _MyMagState createState() => _MyMagState();
}
class _MyMagState extends State<MyMag> {

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        extendBodyBehindAppBar: true,
        body:  ScreenUtilInit(
            designSize: const Size(1920, 1080),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xFF33CC99),
              expandedHeight: 400,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: const Image(image:AssetImage("../assets/images/ban.jpg"),
                  fit: BoxFit.cover,
                ),
                collapseMode: CollapseMode.pin,
                title:ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.transparent,
                    elevation: 5,
                  ),
                  icon: const FaIcon(FontAwesomeIcons.book, size: 20,
                    color: Color(
                        0xFF338D6F),),
                  label: Text(
                    "LE MAGASIN",
                    style: GoogleFonts.merriweatherSans(
                      color: const Color(0xFF338D6F),
                      fontSize: 30.h,
                    ),
                  ),
                ),
                centerTitle:true,
              ),
              title: Text('Maison Jeanne et Jean', style: GoogleFonts.rochester(
                  color: Colors.white, fontSize: 18),),
              leading:IconButton(
                icon:  const FaIcon(FontAwesomeIcons.shop, color: Color(
                    0xFF33CC99),size:18),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.phone, color: Colors.white,size:15),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF33CC99),
                      textStyle: GoogleFonts.rochester(color: Colors.white)),
                  label: const Text(''),
                  onPressed: _launchCaller,
                ),
              ],
            ),
            buildImages(),
          ],
        );
          })
      );
  Widget buildImages() => SliverToBoxAdapter(
      child: MyMagas(magas: "magasin")
  );

  _launchCaller() async {
    const url = "tel:0621227568";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}