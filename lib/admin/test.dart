import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeanneetjean/admin/inscriptionad/colisad.dart';
import 'package:jeanneetjean/admin/page/TextAd.dart';
import 'package:jeanneetjean/admin/inscriptionad/panierad.dart';
import 'package:jeanneetjean/admin/inscriptionad/visitead.dart';
import 'package:jeanneetjean/admin/page/page.dart';
import '../drawer.dart';

class MyAdminTest extends StatefulWidget {
  MyAdminTest({Key? key, required this.validation}) : super(key: key);
  bool validation;

  @override
  _MyAdminTestState createState() => _MyAdminTestState();
}

class _MyAdminTestState extends State<MyAdminTest> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Administration'),
              backgroundColor: const Color(0xFF33CC99),
              actions: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF33CC99),
                      textStyle:
                          GoogleFonts.merriweatherSans(color: Colors.white)),
                  label: const Text('RETOUR'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAdminTest(
                                validation: true,
                              )),
                    );
                  },
                ),
              ],
            ),
            SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    AdVisite(),
                    AdColis(),
                    Ad(menu: 'magasin'),
                    Ad(menu: 'histoire'),
                    Ad(menu: 'agrikolis'),
                    Ad(menu: 'fabrication'),
                    Ad(menu: 'produit'),
                    TextAd(menu: 'colis'),
                    TextAd(menu: 'visite'),
                    TextAd(menu: 'panier'),
                    // Scrollable horizontal widget here
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
