import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({required this.footer, super.key});

  final Widget footer;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery
        .of(context)
        .orientation == Orientation.portrait) {
      return  Container(
        height:250.h,
        width:MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white60,
        ),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  // les horaires
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //adresse
                        Text( 'Lavignac, 56190 Ambon',
                          style: GoogleFonts.rochester(
                            color: Colors.black,fontSize:25.h,),
                        ),
                        const SizedBox(
                          width:10,
                        ),
                        TextButton.icon(
                          onPressed: null,
                          icon: const FaIcon(FontAwesomeIcons.clock, color: Color(0xFF33CC99),size:15),
                          label: Text( '   mercredi: 10:00–12:30\n   jeudi: 10:00–12:30\n   vendredi: 10:00–12:30, 14:30–19:00\n   samedi: 10:00–12:30',
                            style: GoogleFonts.rochester(
                              color: Colors.black,fontSize:18.h,
                            ),),
                        ),
                      ]
                  ),
                  // les reseaux sociaux
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: null,
                          icon: const FaIcon(FontAwesomeIcons.facebook, color: Color(0xFF33CC99),size:20),
                          label: Text( 'Facebook',
                            style: GoogleFonts.rochester(
                              color: Colors.black,fontSize:25.h,
                            ),),
                        ),
                        const SizedBox(height:10,),
                        TextButton.icon(
                          onPressed: null,
                          icon: const FaIcon(FontAwesomeIcons.instagram, color: Color(0xFF33CC99),size:20),
                          label: Text( 'Instagram',
                            style: GoogleFonts.rochester(
                                color: Colors.black,fontSize:25.h
                            ),),),
                        const SizedBox(height:10,),
                        TextButton.icon(
                          onPressed: null,
                          icon: const FaIcon(FontAwesomeIcons.envelope, color: Color(0xFF33CC99),size:20),
                          label: Text( 'E-mail',
                            style: GoogleFonts.rochester(
                              color: Colors.black,fontSize:25.h,
                            ),),)
                      ]
                  ),
                  const SizedBox(
                    width:10,
                  ),

                ]

            ),
            SizedBox(height:15),
            Expanded(
            child: Container(
              height:40.h,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('site réalisé par : ', style: GoogleFonts.michroma(color: Colors.white,fontSize: 15.h,fontWeight: FontWeight.w300)),
                      TextButton(
                        onPressed: () {
                          launchUrlString("http://www.amelisa.fr");
                        },
                        child: Text(
                          'Amelisa Digital',style: GoogleFonts.michroma(color: Colors.white,fontSize: 15.h,fontWeight: FontWeight.w300), //title
                          textAlign: TextAlign.end, //aligment
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ],
        ),
      );
    }
    else{
      return  Container(
        height:200.h,
        width:MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white60,
        ),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  //logo
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:AssetImage("../assets/logo.png"),
                  ),
                  const SizedBox(
                    width:20,
                  ),
                  //adresse
                  const FaIcon(
                      FontAwesomeIcons.locationDot, color:Color(0xFF33CC99)),
                  const SizedBox(
                    width:10,
                  ),
                  Text( 'Lavignac, 56190 Ambon',
                    style: GoogleFonts.rochester(
                      color: Colors.black,fontSize:25.h,),
                  ),
                  const SizedBox(
                    width:50,
                  ),
                  // les reseaux sociaux
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                         onPressed: () {
      launchUrlString("https://www.facebook.com/people/Maison-Jeanne-Jean-Ambon/100057385542583/");
      },
                          icon: const FaIcon(FontAwesomeIcons.facebook, color: Color(0xFF33CC99),size:20),
                          label: Text( 'Facebook',
                            style: GoogleFonts.rochester(
                              color: Colors.black,fontSize:25.h,
                            ),),
                        ),
                        const SizedBox(height:10,),
                        TextButton.icon(
                          onPressed: null,
                          icon: const FaIcon(FontAwesomeIcons.instagram, color: Color(0xFF33CC99),size:20),
                          label: Text( 'Instagram',
                            style: GoogleFonts.rochester(
                                color: Colors.black,fontSize:25.h
                            ),),),
                        const SizedBox(height:10,),
                       /* TextButton.icon(
                          onPressed: null,
                          icon: const FaIcon(FontAwesomeIcons.envelope, color: Color(0xFF33CC99),size:20),
                          label: Text( 'E-mail',
                            style: GoogleFonts.rochester(
                              color: Colors.black,fontSize:20.h,
                            ),),)*/
                      ]
                  ),
                  const SizedBox(
                    width:50,
                  ),
                  // les horaires
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: null,
                          icon: const FaIcon(FontAwesomeIcons.clock, color: Color(0xFF33CC99),size:15),
                          label: Text( '   mercredi: 10:00–12:30\n   jeudi: 10:00–12:30\n   vendredi: 10:00–12:30, 14:30–19:00\n   samedi: 10:00–12:30',
                            style: GoogleFonts.rochester(
                              color: Colors.black,fontSize:25.h,
                            ),),
                        ),
                      ]
                  ),
                ]

            ),
            SizedBox(height:15),
            Expanded(
              child: Container(
                height:50,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('site réalisé par : ', style: GoogleFonts.michroma(color: Colors.white,fontSize: 15.w,fontWeight: FontWeight.w300)),
                      TextButton(
                        onPressed: () {
                          launchUrlString("https://www.amelisa.fr");
                        },
                        child: Text(
                          'Amelisa Digital',style: GoogleFonts.michroma(color: Colors.white,fontSize: 15.w,fontWeight: FontWeight.w300), //title
                          textAlign: TextAlign.end, //aligment
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ],
        ),
      );
    }

  }
}
