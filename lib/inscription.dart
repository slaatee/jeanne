import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeanneetjean/inscript/inscription.dart';


class MyInscri extends StatelessWidget {
  const MyInscri({required this.inscription, super.key});

  final Widget inscription;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Container(
        height: 380.h,
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
              indent: 400,
              endIndent: 400,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.penToSquare,
                      color: Colors.white),
                  const SizedBox(height: 10),
                  Text(
                    'INSCRIVEZ  VOUS  À NOS : ',
                    style: GoogleFonts.merriweatherSans(
                        color: Colors.white,
                        fontSize: 25.h,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>MyInscription(inscription: 'colis')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(color: Colors.black)),
                        elevation: 10,
                        padding: const EdgeInsets.all(20),
                        primary: Colors.white, // <-- Button color
                        onPrimary: Colors.red, // <-- Splash color
                      ),
                      child: const Image(
                        image: AssetImage(
                          "../assets/images/icon/beef21.png",
                        ),
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '  Colis de viande ',
                      style: GoogleFonts.rochester(
                          color: Colors.black, fontSize: 22.h),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyInscription(inscription: 'panier')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(color: Colors.black)),
                        elevation: 10,
                        padding: EdgeInsets.all(20),
                        primary: Colors.white, // <-- Button color
                        onPrimary: Colors.deepOrangeAccent, // <-- Splash color
                      ),
                      child: const Image(
                        image: AssetImage(
                          "../assets/images/icon/panier21.png",
                        ),
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Paniers',
                      style: GoogleFonts.rochester(
                          color: Colors.black, fontSize: 24.h),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyInscription(inscription: 'visite')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(color: Colors.black)),
                        elevation: 10,
                        padding: const EdgeInsets.all(20),
                        primary: Colors.white, // <-- Button color
                        onPrimary: Colors.green, // <-- Splash color
                      ),
                      child: const Image(
                        image: AssetImage(
                          "../assets/images/icon/tractor21.png",
                        ),
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Visites à la ferme',
                      style: GoogleFonts.rochester(
                          color: Colors.black, fontSize: 24.h),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              height: 30,
              thickness: 1,
              color: Colors.white,
              indent: 400,
              endIndent: 400,
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 500.h,
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
          children: [
            const SizedBox(height: 25),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.penToSquare,
                      color: Colors.white),
                  const SizedBox(width: 25),
                  Text(
                    'INSCRIVEZ  VOUS  À NOS : ',
                    style: GoogleFonts.merriweatherSans(
                        color: Colors.white,
                        fontSize: 25.h,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Colis de viande',
                      style: GoogleFonts.rochester(
                          color: Colors.black, fontSize: 30.h),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyInscription(inscription: 'colis')),
                        );
                      },
                      child: Image(
                        image: AssetImage(
                          "../assets/images/icon/beef21.png",
                        ),
                        height: 50,
                        width: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(color: Colors.black)),
                        elevation: 20,
                        padding: const EdgeInsets.all(20),
                        primary: Colors.white, // <-- Button color
                        onPrimary: Colors.red, // <-- Splash color
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      'Paniers',
                      style: GoogleFonts.rochester(
                          color: Colors.black, fontSize: 30.h),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyInscription(inscription: 'panier')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(color: Colors.black)),
                        elevation: 20,
                        padding: EdgeInsets.all(20),
                        primary: Colors.white, // <-- Button color
                        onPrimary: Colors.deepOrangeAccent, // <-- Splash color
                      ),
                      child: const Image(
                        image: AssetImage(
                          "../assets/images/icon/panier21.png",
                        ),
                        height: 50,
                        width: 50,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      'Visites à la ferme',
                      style: GoogleFonts.rochester(
                          color: Colors.black, fontSize: 30.h),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyInscription(inscription: 'visite')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(color: Colors.black)),
                        elevation: 20,
                        padding: const EdgeInsets.all(20),
                        primary: Colors.white, // <-- Button color
                        onPrimary: Colors.green, // <-- Splash color
                      ),
                      child: const Image(
                        image: AssetImage(
                          "../assets/images/icon/tractor21.png",
                        ),
                        height: 50,
                        width: 50,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
