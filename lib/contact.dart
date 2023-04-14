import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:jeanneetjean/admin/mail/Mail.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../drawer.dart';
import 'main.dart';

class MyContact extends StatefulWidget {
  const MyContact({Key? key}) : super(key: key);

  @override
  _MyContactState createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  final controllerNumero = TextEditingController();
  final controllerNom = TextEditingController();
  final controllerMail = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerText = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF33CC99).withOpacity(0.2),
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            style: ElevatedButton.styleFrom(
                primary: const Color(0xFF33CC99),
                textStyle: GoogleFonts.merriweatherSans(color: Colors.white)),
            label: const Text('RETOUR'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
            return Material(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 500.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xFF33CC99),
                        image: DecorationImage(
                          image: const AssetImage(
                            "../assets/images/photo/IMG_8168.jpg",
                          ),
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.9), BlendMode.dstATop),
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
                                radius: 62,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      AssetImage("../assets/logo2.png"),
                                )),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.transparent,
                                    elevation: 5,
                                  ),
                                  icon: const FaIcon(
                                    FontAwesomeIcons.cow,
                                    size: 20,
                                    color: Color(0xFF0FA5BF),
                                  ),
                                  label: Text(
                                    "BESOIN D'UN RENSEIGNEMENT ?",
                                    style: GoogleFonts.merriweatherSans(
                                      color: Color(0xFF0FA5BF),
                                      fontSize: 50.w,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ]),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.white,
                      height: 500.h,
                      width: MediaQuery.of(context).size.width - 50.w,
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: Form(
                          key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                controller: controllerNom,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.account_circle),
                                  labelText: 'Nom',
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty) {
                                    return 'rentrez votre nom';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: controllerSubject,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.subject),
                                  labelText: 'Sujet',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                keyboardType:
                                TextInputType.number,
                                inputFormatters: <
                                    TextInputFormatter>[
                                  FilteringTextInputFormatter
                                      .digitsOnly
                                ],
                                controller: controllerNumero,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.phone),
                                  labelText: 'Numéro de télephone',
                                  hintText:
                                  "Veuillez saisir des chiffres uniquement",
                                ),
                              ),
                              TextFormField(
                                controller: controllerMail,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.mail),
                                  labelText: 'Mail',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                minLines: 2,
                                maxLines: 5,
                                keyboardType: TextInputType.multiline,
                                controller: controllerText,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.text_fields),
                                  labelText: 'votre texte',
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                              ),
                              FloatingActionButton.extended(
                                onPressed: () => {
                                  if (_formKey.currentState!
                                      .validate())
                                  setState(

                                    () {
                                      Mail c = Mail(
                                          recipient: "ambon@magasinalaferme.fr",
                                          msgBody:
                                              "Mail du : ${DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()}\n\n\n Nom : ${controllerNom.text}\n\n\n Mail : ${controllerMail.text}\n\n\nNuméro : ${controllerNumero.text}\n\n\n\n${controllerText.text}",
                                          subject: controllerSubject.text);
                                      postMail(c);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) => _buildPopupDialog(context),
                                      );
                                    },
                                  ),
                                },
                                label: const Text(
                                  "Envoi",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                backgroundColor: Colors.teal,
                                elevation: 20,
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
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

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: const Color(0xFF33CC99),
    title: Text("Mail envoyé",
        style: GoogleFonts.rochester(color: Colors.white, fontSize: 25.h)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Demande bien reçu",
            style: GoogleFonts.rochester(color: Colors.black, fontSize: 25.h)),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyApp()),
          );
        },
        child: Text(
          'Retour Acceuil',
          style:
              GoogleFonts.merriweatherSans(color: Colors.white, fontSize: 18.h),
        ),
      ),
    ],
  );
}
