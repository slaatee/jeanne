import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jeanneetjean/admin/page/TextAd.dart';
import 'package:jeanneetjean/admin/page/page.dart';
import 'package:jeanneetjean/inscript/inscription.dart';

import 'package:jeanneetjean/mag/produits.dart';
import 'package:jeanneetjean/main.dart';

import 'inscriptionad/colisad.dart';
import 'inscriptionad/panierad.dart';
import 'inscriptionad/visitead.dart';





class NavigationDrawerAdmin extends StatelessWidget{
  const NavigationDrawerAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            buildHeader(context),
            buildMenu(context),
          ],
        ),
      )
  );
  Widget buildHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(
        top: 24+MediaQuery.of(context).padding.top,
        bottom:24,
      ),
      color: const Color(0xFF33CC99),
      child: Column(
        children: [
          Text('Administration', style: GoogleFonts.rochester(
              color: Colors.white,fontSize: 28),
          ),

        ],
      )
  );
  Widget buildMenu(BuildContext context) =>Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 1,
      children: [
        ListTile(
          title: Text(
            'Retour au site', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.house,color: Color(0xFF33CC99)),
          onTap: (){ Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Home()),);
          },
        ),
        ListTile(
          title: Text(
            'Panier', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.basketShopping,color: Color(0xFF33CC99)),
          onTap: (){ Navigator.push(context,
            MaterialPageRoute(builder: (context) => AdPanier()),);
          },
        ),
        ListTile(
          title: Text(
            'Visite', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const  FaIcon(FontAwesomeIcons.book,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdVisite(),),
            );
          },
        ),
        ListTile(
          title: Text(
            'Colis', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.shop,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  AdColis(),),
            );
          },
        ),
        ListTile(
          title: Text(
            'Magasin', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.cubesStacked,color: Color(0xFF33CC99)),
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ad(menu: 'magasin'),),
          );
          },
        ),
        ListTile(
          title: Text(
            'Histoire', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.cow,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ad(menu: 'histoire'),),
            );
          },
        ),
        ListTile(
          title: Text(
            'Agrikolis', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.boxesPacking,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ad(menu: 'agrikolis'),),);
          },
        ),
        ListTile(
          title: Text(
            'Fabrication', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.basketShopping,color: Color(0xFF33CC99)),
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ad(menu: 'fabrication'),),);
          },
        ),
        ListTile(
          title: Text(
            'Produit', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.boxOpen,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ad(menu: 'produit'),),);
          },
        ),
        ListTile(
          title: Text(
            'Colis Texte', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.tractor,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TextAd(menu: 'colis'),),);
          },
        ),
        ListTile(
          title: Text(
            'Visite Texte', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.tractor,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TextAd(menu: 'visite'),),);
          },
        ),
        ListTile(
          title: Text(
            'Panier Texte', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.tractor,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TextAd(menu: 'panier'),),);
          },
        ),
      ],),
  );
}