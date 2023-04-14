import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeanneetjean/admin/mail/Mail.dart';
import 'package:jeanneetjean/main.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;
import '../admin/article/Article.dart';
import '../drawer.dart';
import 'package:intl/intl.dart';

class MyInscription extends StatefulWidget {
  MyInscription({Key? key, required this.inscription}) : super(key: key);

  final String inscription;

  @override
  _MyInscriptionState createState() => _MyInscriptionState();
}

class _MyInscriptionState extends State<MyInscription> {
  //controller
  final controllerNumero = TextEditingController();
  final controllerNom = TextEditingController();
  final controllerMail = TextEditingController();
  //formulaire
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //list
  late List data;

  @override
  void initState() {
    super.initState();
    getArticlebyName(widget.inscription);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
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
      body: FutureBuilder<List<Article>>(
          future: getArticlebyName(widget.inscription),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Article> a = snapshot.data as List<Article>;
              return ListView.builder(
                  itemCount: a.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 1.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: const Color(0xFF33CC99),
                            image: DecorationImage(
                              image: Image.network(a[index].photo).image,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.9),
                                  BlendMode.dstATop),
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
                                      backgroundImage:
                                          AssetImage("../assets/logo2.png"),
                                    )),
                                const SizedBox(height: 40),
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
                                      icon: FaIcon(
                                        FontAwesomeIcons.tractor,
                                        size: 20,
                                        color: Color(int.parse(a[index].lien)),
                                      ),
                                      label: Text(
                                        a[index].titre,
                                        style: GoogleFonts.merriweatherSans(
                                          color:
                                              Color(int.parse(a[index].lien)),
                                          fontSize: 55.w,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ),
                        const SizedBox(height: 50),
                        Container(
                          width: queryData.size.width / 1.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                a[index].text,
                                style: GoogleFonts.rochester(
                                    color: Colors.black, fontSize: 22),
                              ),
                              const SizedBox(height: 100),
                              Form(
                                key: _formKey,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Inscrivez vous:',
                                        style: GoogleFonts.rochester(
                                            color: Colors.black, fontSize: 25),
                                      ),
                                      const SizedBox(height: 40),
                                      Container(
                                          width: 500,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller: controllerNom,
                                                decoration:
                                                    const InputDecoration(
                                                  icon: Icon(
                                                      Icons.account_circle),
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
                                              const SizedBox(height: 30),
                                              TextFormField(
                                                controller: controllerMail,
                                                decoration:
                                                    const InputDecoration(
                                                  icon: Icon(Icons.mail),
                                                  labelText: 'Mail',
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty ||
                                                      !value.contains('@')) {
                                                    return 'rentrez votre email';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              const SizedBox(height: 30),
                                              TextFormField(
                                                controller: controllerNumero,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration:
                                                    const InputDecoration(
                                                  icon: Icon(Icons.phone),
                                                  labelText:
                                                      'Numéro de télephone',
                                                  hintText:
                                                      "Veuillez saisir des chiffres uniquement",
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'rentrez votre numéro';
                                                  } else if (value.length !=
                                                      10) {
                                                    return 'vérifiez votre numero!';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              const SizedBox(height: 50),
                                              FloatingActionButton.extended(
                                                onPressed: () => {
                                                  if (_formKey.currentState!
                                                      .validate())
                                                    {
                                                      setState(() {
                                                        create();
                                                      })
                                                    },
                                                },
                                                label: Text(
                                                  "Envoi",
                                                  style: GoogleFonts
                                                      .merriweatherSans(
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                ),
                                                backgroundColor: Colors.teal,
                                                elevation: 20,
                                                icon: const Icon(
                                                  Icons.send,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ))
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Future create() async {
    String url = "https://amelisadigital.eu:8443/api/" + widget.inscription;
    String user = 'aurore';
    String password = 'JustinMartin';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$password'));
    var res = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': basicAuth,
        },
        body: json.encode({
          'nom_' + widget.inscription: controllerNom.text,
          'mail_' + widget.inscription: controllerMail.text,
          'phone_' + widget.inscription: controllerNumero.text,
          'date_' + widget.inscription:
              DateFormat('dd/MM/yyyy').format(DateTime.now())
        }));

    print(res.body);
    if (res.statusCode == 200) {
      Mail m = Mail(
          recipient: "ambon@magasinalaferme.fr",
          msgBody:
              "Inscription au ${widget.inscription}\n En date du :${DateFormat('dd/MM/yyyy').format(DateTime.now())}\n\nNouvel inscrit Mr : ${controllerNom.text}\nMail : ${controllerMail.text}\nNuméro de téléphone : ${controllerNumero.text}",
          subject: "Inscription au " + widget.inscription.toString());
      postMail(m);
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(context),
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
      title: Text(widget.inscription + 'Reçu',
          style: GoogleFonts.rochester(color: Colors.white, fontSize: 25.h)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Demande bien reçu",
              style:
                  GoogleFonts.rochester(color: Colors.black, fontSize: 25.h)),
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
            style: GoogleFonts.merriweatherSans(
                color: Colors.white, fontSize: 18.h),
          ),
        ),
      ],
    );
  }
}
