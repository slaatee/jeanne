import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../drawer.dart';
import 'magas.dart';

class MyCol extends StatefulWidget {
  const MyCol({Key? key}) : super(key: key);
  static const String route = '/agrikolis';
  @override
  _MyColState createState() => _MyColState();
}
class _MyColState extends State<MyCol> {


  @override
  Widget build(BuildContext context)=>
    Scaffold(
      drawer: const NavigationDrawer(),
      body:ScreenUtilInit(
  designSize: const Size(1920, 1080),
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (context, child) {
  return  CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF33CC99),
            expandedHeight: 400,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
          background: const Image(image:AssetImage("../assets/images/agrikol.jpg"),
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.pin,
              title: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.transparent, backgroundColor: Colors.white,
                  elevation: 5,
                ),
                icon: const FaIcon(FontAwesomeIcons.tractor, size: 20,
                  color: Color(
                      0xFF33CC99),),
                label: Text(
                  "AGRIKOLIS",
                  style: GoogleFonts.merriweatherSans(
                    color: const Color(0xFF205B4B),
                    fontSize: 35.h,
                  ),
                ),
              ),
              centerTitle:true,
            ),
            title: Text('Maison Jeanne et Jean', style: GoogleFonts.rochester(
                color: Colors.white, fontSize: 18),),
            leading: IconButton(
              icon:  FaIcon(FontAwesomeIcons.tractor, color: const Color(0xFF205B4B),size:18),
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
          buildAgrikolis(),
        ],
      );})
    );
    Widget buildAgrikolis() => SliverToBoxAdapter(
        child: MyMagas(magas: "agrikolis")
    );
  }


_launchCaller() async {
  const url = "tel:0621227568";
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}