import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jeanneetjean/inscript/inscription.dart';
import 'package:jeanneetjean/mag/magas.dart';
import 'package:jeanneetjean/mag/produits.dart';
import 'package:jeanneetjean/main.dart';
import 'mag/agrikolis.dart';
import 'mag/fabrication.dart';
import 'mag/histoire.dart';
import 'mag/magasin.dart';




class NavigationDrawer extends StatelessWidget{
  const NavigationDrawer({Key? key}) : super(key: key);

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
          const CircleAvatar(
            radius: 70,
            backgroundImage:AssetImage("../assets/logo.png"),
          ),
          const SizedBox(height:32),
          Text('Maison Jeanne et Jean', style: GoogleFonts.rochester(
              color: Colors.white,fontSize: 28),
          ),
          Text(
            'MAGASIN A LA FERME', style: GoogleFonts.merriweatherSans(
              color: Colors.white,fontSize: 12),
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
            'Accueil', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.house,color: Color(0xFF33CC99)),
          onTap: (){  Navigator.of(context).pushNamed(Home.route);
          },
        ),
        ListTile(
          title: Text(
            'Histoire', style: GoogleFonts.rochester(
              color: Colors.black,fontSize: 22,),
          ),
          leading : const  FaIcon(FontAwesomeIcons.book,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.of(context).pushNamed(MyHistoire.route);
          },
        ),
        ListTile(
          title: Text(
            'Le magasin', style: GoogleFonts.rochester(
              color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.shop,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.of(context).pushNamed(MyMag.route);
          },
        ),
        ListTile(
          title: Text(
            'Les produits', style: GoogleFonts.rochester(
              color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.cubesStacked,color: Color(0xFF33CC99)),
          onTap: (){ Navigator.of(context).pushNamed(MyProd.route);
          },
        ),
        ListTile(
          title: Text(
            'Nos fabrications', style: GoogleFonts.rochester(
              color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.cow,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.of(context).pushNamed(MyFab.route);
          },
        ),
        ListTile(
          title: Text(
            'Agrikolis', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.boxesPacking,color: Color(0xFF33CC99)),
          onTap: (){ Navigator.of(context).pushNamed(MyCol.route);
          },
        ),
        ListTile(
          title: Text(
            'Nos paniers', style: GoogleFonts.rochester(
              color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.basketShopping,color: Color(0xFF33CC99)),
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyInscription(inscription: "panier")),);
          },
        ),
        ListTile(
          title: Text(
            'Nos colis de viande', style: GoogleFonts.rochester(
              color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.boxOpen,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyInscription(inscription: "colis")),);
          },
        ),
        ListTile(
          title: Text(
            'Visites à la ferme', style: GoogleFonts.rochester(
            color: Colors.black,fontSize: 22,),
          ),
          leading : const FaIcon(FontAwesomeIcons.tractor,color: Color(0xFF33CC99)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyInscription(inscription: "visite")),);
          },
        ),

      ],),
  );
}