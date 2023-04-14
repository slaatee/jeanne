import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeanneetjean/inscript/inscription.dart';
import 'mag/agrikolis.dart';
import 'mag/magasin.dart';

class MyBut extends StatelessWidget {
  const MyBut({required this.butbar, super.key});

  final Widget butbar;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Container(
        height: 1000.h,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF307960),
              Color(0xFF33CC99),
            ],),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.white,
              indent: 300,
              endIndent: 300,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(

                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  shadowColor: Colors.black,
                  elevation: 10,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 380.h,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 250.h,
                          width: 150.h,
                          child: Column(
                            children: [
                              const Image(
                                image: AssetImage(
                                  "../assets/images/icon/shop21.png",
                                ),
                                height: 40,
                                width: 40,
                              ),
                              ListTile(
                                title: Text('MAGASIN',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.merriweatherSans(
                                      color: const Color(0xFF33CC99),
                                      fontSize: 18.h,
                                    )),
                              ),
                              IconButton(
                                onPressed: () => {
                                Navigator.of(context).pushNamed(MyMag.route)
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.circleArrowRight,
                                  size: 18,
                                  color: Color(0xFF33CC99),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 250.h,
                          width: 200.h,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 200.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Venez découvrir notre lait\n nos glaces artisanales \n et tout nos produits locaux',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rochester(
                                        color: Colors.black,
                                        fontSize: 24.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  shadowColor: Colors.black,
                  elevation: 30,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 380.h,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 250.h,
                          width: 150.h,
                          child: Column(
                            children: [
                              const Image(
                                image: AssetImage(
                                  "../assets/images/icon/colis21.png",
                                ),
                                height: 40,
                                width: 40,
                              ),
                              ListTile(
                                title: Text('AGRIKOLIS',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.merriweatherSans(
                                      color: const Color(0xFF33CC99),
                                      fontSize: 18.h,
                                    )),
                              ),
                              IconButton(
                                onPressed: () => {
                                Navigator.of(context).pushNamed(MyCol.route)
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.circleArrowRight,
                                  size: 18,
                                  color: Color(0xFF33CC99),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 250.h,
                          width: 200.h,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 200.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Nos prestations Agrikolis\n '
                                      'Ecomiam ',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rochester(
                                        color: Colors.black,
                                        fontSize: 24.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  shadowColor: Colors.black,
                  elevation: 30,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 380.h,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 320.h,
                          width: 150.h,
                          child: Column(
                            children: [
                              const Image(
                                image: AssetImage(
                                  "../assets/images/icon/tractor21.png",
                                ),
                                height: 40,
                                width: 40,
                              ),
                              ListTile(
                                title: Text('VISITES A LA FERME',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.merriweatherSans(
                                      color: const Color(0xFF33CC99),
                                      fontSize: 18.h,
                                    )),
                              ),
                              IconButton(
                                onPressed: () => {Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyInscription(inscription: 'visite')),)
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.circleArrowRight,
                                  size: 25,
                                  color: Color(0xFF33CC99),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 320.h,
                          width: 200.h,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 300.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Venez visiter une exploitation agricole, '
                                      'vous apprendrez à mieux connaître la vie du monde rural,\n'
                                      'les métiers de la ferme,'
                                      'ses activités humaines et économiques.',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rochester(
                                        color: Colors.black,
                                        fontSize: 23.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.white,
              indent: 300,
              endIndent: 300,
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(top:100),
        alignment: Alignment.center,
        height: 950.h,

        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF307960),
              Color(0xFF33CC99),
            ],),
        ),
        child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      shadowColor: Colors.black,
                      elevation: 30,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 670.h,
                            width: 550.w,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                const Image(
                                  image: AssetImage(
                                    "../assets/images/icon/shop21.png",
                                  ),
                                  height: 50,
                                  width: 50,
                                ),
                                ListTile(
                                  title: Text('Magasin',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rochester(
                                        color: const Color(0xFF33CC99),
                                        fontSize: 35.h,
                                      )),
                                ),
                                SizedBox(
                                  height: 175.h,
                                  child: Text(
                                    'Venez découvrir notre lait\n nos glaces artisanales \n et tout nos produits locaux',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.merriweatherSans(
                                      color: Colors.black,
                                      fontSize: 20.h,fontWeight: FontWeight.w100
                                    ),
                                  ),
                                ),
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage:AssetImage("../assets/logo.png"),
                                ),
                                IconButton(
                                  onPressed: () => {
                                  Navigator.of(context).pushNamed(MyMag.route)
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.circleArrowRight,
                                    size: 25,
                                    color: Color(0xFF33CC99),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      shadowColor: Colors.black,
                      elevation: 30,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 670.h,
                            width:550.w,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                const Image(
                                    image: AssetImage(
                                      "../assets/images/icon/colis21.png",
                                    ),
                                    height: 50,
                                    width: 50,
                                    filterQuality: FilterQuality.high),
                                ListTile(
                                  title: Text('Agrikolis',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rochester(
                                        color: const Color(0xFF33CC99),
                                        fontSize: 35.h,
                                      )),
                                ),
                                Container(
                                  height: 175.h,
                                  child: Text(
                                    'Nos prestations Agrikolis\n '
                                    'Ecomiam ',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.merriweatherSans(
                                      color: Colors.black,
                                      fontSize: 20.h,fontWeight: FontWeight.w100
                                    ),
                                  ),
                                ),
                                Wrap(
                                  children: const [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage:AssetImage("../assets/images/agrikolis.png"),
                                    ),
                                    SizedBox(width:10),
                                    CircleAvatar(
                                      maxRadius: 40,
                                      backgroundImage:AssetImage("../assets/images/ecomiam.png"),
                                    ),SizedBox(width:10),
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage:AssetImage("../assets/images/cdiscount.png"),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(MyCol.route);
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.circleArrowRight,
                                    size: 25,
                                    color: Color(0xFF33CC99),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      shadowColor: Colors.black,
                      elevation: 30,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 670.h,
                            width: 550.w,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                const Image(
                                    image: AssetImage(
                                      "../assets/images/icon/tractor21.png",
                                    ),
                                    height: 50,
                                    width: 50,
                                    filterQuality: FilterQuality.high),
                                ListTile(
                                  title: Text('Visites à la ferme',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rochester(
                                        color: const Color(0xFF33CC99),
                                        fontSize: 35.h,
                                      )),
                                ),
                                Container(
                                  height: 175.h,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Venez visiter une exploitation agricole, '
                                    'vous apprendrez à mieux connaître la vie du monde rural,\n'
                                    'les métiers de la ferme,'
                                    '2 € Adultes, 1€ Enfants',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.merriweatherSans(
                                      color: Colors.black,
                                      fontSize: 20.h,fontWeight: FontWeight.w100
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage:AssetImage("../assets/images/visit.png"),
                                    ),
                                    SizedBox(width:15),
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage:AssetImage("../assets/images/agri.png"),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () => {Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyInscription(inscription: 'visite')),)
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.circleArrowRight,
                                    size: 25,
                                    color: Color(0xFF33CC99),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
      );
    }
  }
}
