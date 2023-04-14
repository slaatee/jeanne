import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeanneetjean/admin/inscriptionad/colisad.dart';
import 'package:jeanneetjean/admin/page/TextAd.dart';
import 'package:jeanneetjean/admin/inscriptionad/panierad.dart';
import 'package:jeanneetjean/admin/inscriptionad/visitead.dart';
import 'package:jeanneetjean/admin/page/page.dart';
import '../drawer.dart';

class MyAdmin extends StatefulWidget {
  MyAdmin({Key? key,required this.validation}) : super(key: key);
   bool validation;

  @override
  _MyAdminState createState() => _MyAdminState();


}

class _MyAdminState extends State<MyAdmin> {

  @override
  Widget build (BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 11,
        child: Scaffold(
          appBar: AppBar(
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
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MyAdmin(validation: true,)),);
                },
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: FaIcon(FontAwesomeIcons.basketShopping,
                      color: Colors.white),
                  child: Text('Panier'),
                ),
                Tab(
                    child: Text('Visite'),
                    icon:
                    FaIcon(FontAwesomeIcons.tractor, color: Colors.white)),
                Tab(
                    child: Text('Colis'),
                    icon:
                    FaIcon(FontAwesomeIcons.boxOpen, color: Colors.white)),
                Tab(
                    child: Text('magasin'),
                    icon:
                    FaIcon(FontAwesomeIcons.shop, color: Colors.white)),
                Tab(
                    child: Text('Histoire'),
                    icon:
                    FaIcon(
                        FontAwesomeIcons.scaleBalanced, color: Colors.white)),
                Tab(
                    child: Text('Agrikolis'),
                    icon:
                    FaIcon(
                        FontAwesomeIcons.boxesPacking, color: Colors.white)),
                Tab(
                    child: Text('Fabrication'),
                    icon:
                    FaIcon(
                        FontAwesomeIcons.productHunt, color: Colors.white)),
                Tab(
                    child: Text('Produit'),
                    icon:
                    FaIcon(
                        FontAwesomeIcons.shop, color: Colors.white)),
                Tab(
                    child: Text('Colis texte'),
                    icon:
                    FaIcon(FontAwesomeIcons.box, color: Colors.white)),
                Tab(
                    child: Text('Visite texte'),
                    icon:
                    FaIcon(FontAwesomeIcons.eye, color: Colors.white)),
                Tab(
                    child: Text('Panier texte'),
                    icon:
                    FaIcon(
                        FontAwesomeIcons.bagShopping, color: Colors.white)),
              ],
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 2,
            ),

          ),
          drawer: const NavigationDrawer(),
          body: TabBarView(

            children:[
              AdPanier(),
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
            ],
          ),
        ),
      ),
    );

  }

  }


