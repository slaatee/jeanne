import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeanneetjean/buttombar.dart';
import 'package:jeanneetjean/contact.dart';
import 'package:jeanneetjean/footer.dart';
import 'package:jeanneetjean/inscript/inscription.dart';
import 'package:jeanneetjean/mag/Method.dart';
import 'package:jeanneetjean/mag/agrikolis.dart';
import 'package:jeanneetjean/mag/fabrication.dart';
import 'package:jeanneetjean/mag/histoire.dart';
import 'package:jeanneetjean/map.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'admin/Login.dart';
import 'inscription.dart';
import 'banner.dart';
import 'drawer.dart';
import 'mag/magasin.dart';
import 'mag/produits.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Maison Jeanne et Jean';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        title: _title,
        home: const Home(),
        initialRoute: Home.route,
        routes: {
          '/home': (context) => const Home(),
          '/colis': (context) => MyInscription(inscription: 'colis'),
          '/visite': (context) => MyInscription(inscription: 'visite'),
          '/panier': (context) => MyInscription(inscription: 'panier'),
          MyMag.route: (context) => const MyMag(),
          MyHistoire.route: (context) =>  const MyHistoire(),
          MyCol.route: (context) => const MyCol(),
          MyFab.route : (context) => const MyFab(),
          MyProd.route: (context) => const MyProd(),
          Login.route: (context) => const Login(),});
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String route = '/home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF33CC99).withOpacity(0.2),
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.phone, color: Colors.white),
            style: ElevatedButton.styleFrom(
                primary: const Color(0xFF33CC99),
                textStyle: GoogleFonts.kalam(color: Colors.white)),
            label: const Text(''),
            onPressed: _launchCaller,
          ),
        ],
      ),
      drawer: const NavigationDrawer(),
      body: ScreenUtilInit(
          designSize: const Size(1920, 1080),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            if (MediaQuery.of(context).orientation == Orientation.portrait) {
              return Material(
                child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(children: const [
                      MyBanner(banner: Text('')),
                      MyBut(butbar: Text('')),
                      MyMap(mymap: Text('')),
                      MyInscri(inscription: Text('')),
                      MyFooter(footer: Text('')),
                    ])),
              );
            } else {
              return Material(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(children: const [
                    MyBanner(banner: Text('ban')),
                    MyBut(butbar: Text('but')),
                    MyMap(mymap: Text('map')),
                    MyInscri(inscription: Text('inscription')),
                    MyFooter(footer: Text('foot')),
                  ]),
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyContact()),
          );
        },
        splashColor: Colors.teal,
        tooltip: 'Contact',
        backgroundColor: Colors.transparent,
        elevation: 40,
        child: const Icon(Icons.mail, color: Colors.black, size: 25),
      ),
    );
  }
}

_launchCaller() async {
  const url = "tel:0621227568";
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}
