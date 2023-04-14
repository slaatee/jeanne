import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_launcher/maps_launcher.dart';


class MyMap extends StatelessWidget {
  const MyMap({required this.mymap, super.key});

  final Widget mymap;

  @override
  Widget build(BuildContext context) {

    return  Container(
      height:550.h,
      width:MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("../assets/images/map.jpg",),
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
        color: const Color(0xFF3C6553),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox( height:75),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                const FaIcon(FontAwesomeIcons.locationDot,color: Colors.black),
                const SizedBox(width:25),
                Text('OU NOUS TROUVER : ', style: GoogleFonts.merriweatherSans(
                    color: Colors.black,fontSize: 30.h,fontWeight: FontWeight.bold),
                ),
              ]
          ),
          const SizedBox(height:50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                label: Text('navigation',style: GoogleFonts.rochester(color: Colors.black,fontSize: 30),),
                onPressed: () {
                  MapsLauncher.launchCoordinates(47.555705, -2.543435);
                },
                extendedTextStyle: GoogleFonts.rochester(color: Colors.black),
                tooltip: 'Navigation',
                backgroundColor: const Color(0xFF33CC99),
                elevation: 20,
                icon : const Icon(Icons.navigation,color: Colors.black,),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
