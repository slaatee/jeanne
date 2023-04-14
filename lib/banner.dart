import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeanneetjean/mag/histoire.dart';

import 'mag/produits.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({required this.banner, super.key});

  final Widget banner;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Container(
        height: 700.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
        gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
        Color(0xFF33CC99),
          Color(0xFF307960),
        ],),
          image: DecorationImage(
            image: const AssetImage(
              "../assets/images/cow.jpg",
            ),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 82,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("../assets/logo2.png"),
                  )),
              const SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pushNamed(MyHistoire.route);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.transparent,
                            elevation: 5,
                          ),
                          icon: FaIcon(FontAwesomeIcons.pencil, size: 20,color: Color(0xFF33CC99),),
                          label: Text(
                            "notre histoire",
                            style: GoogleFonts.rochester(
                              color: Color(0xFF33CC99),
                              fontSize: 35.h,
                            ),

                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF33CC99),
                          onPrimary: Colors.black,
                          elevation: 5,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(MyProd.route);
                        },
                        icon: FaIcon(FontAwesomeIcons.basketShopping, size: 20,color: Colors.black,),
                        label: Text(
                          "nos produits",
                          style: GoogleFonts.rochester(
                              color: Colors.black,
                              fontSize: 35.h,fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              )
            ],
          )
        ]),
      );
    } else {
      return Container(
        height: 900.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFF33CC99),
          image: DecorationImage(
            image: const AssetImage(
              "../assets/images/cow.jpg",
            ),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 122,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage("../assets/logo2.png"),
                  )),
              const SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    child: Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(
                              context).pushNamed(MyHistoire.route);
                          },
                        style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                          onPrimary: Colors.transparent,
                          elevation: 5,
                            ),
                          icon: FaIcon(FontAwesomeIcons.pencil, size: 20,color: Color(0xFF33CC99),),
                          label: Text(
                            "notre histoire",
                            style: GoogleFonts.rochester(
                              color: Color(0xFF33CC99),
                              fontSize: 35.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 50),
                  Container(
                    child: Row(children: [

                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF33CC99),
                          onPrimary: Colors.black,
                          elevation: 5,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(MyProd.route);
                        },
                        icon: FaIcon(FontAwesomeIcons.basketShopping, size: 20,color: Colors.black,),
                        label: Text(
                          "nos produits",
                          style: GoogleFonts.rochester(
                            color: Colors.black,
                              fontSize: 35.h,fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              )
            ],
          )
        ]),
      );
    }
  }
}
