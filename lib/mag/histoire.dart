import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../drawer.dart';
import 'magas.dart';

class MyHistoire extends StatefulWidget {
  const MyHistoire({Key? key}) : super(key: key);
  static const String route = '/histoire';
  @override
  _MyHistoireState createState() => _MyHistoireState();
}
class _MyHistoireState extends State<MyHistoire> {


  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: ScreenUtilInit(
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
                background: const Image(image:AssetImage("../assets/images/story.jpg"),
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
                        0xFFEF9308),),
                  label: Text(
                    "NOTRE HISTOIRE",
                    style: GoogleFonts.merriweatherSans(
                      color: const Color(0xFFEF9308),
                      fontSize: 30.h,
                    ),
                  ),
                ),
                centerTitle:true,
              ),
              title: Text('Maison Jeanne et Jean', style: GoogleFonts.rochester(
                  color: Colors.white, fontSize: 18),),
              leading:IconButton(
                icon:  const FaIcon(FontAwesomeIcons.tractor, color: Color(0xFFEF9308),size:18),
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
            );})
      );
Widget buildImages() => SliverToBoxAdapter(
    child: MyMagas(magas: "histoire")
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