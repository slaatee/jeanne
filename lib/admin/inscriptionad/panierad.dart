import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';

import '../adminstration.dart';

class Panier {
  final int? id_panier;
  final String? nom_panier;
  final String? mail_panier;
  final String? phone_panier;
  final String? date_panier;

  Panier(
      {required this.id_panier,
        required this.nom_panier,
        required this.mail_panier,
        required this.phone_panier,
        required this.date_panier});

  factory Panier.fromJson(Map<String, dynamic> parsedJson) {
    return Panier(
      id_panier: parsedJson['id_panier'],
      nom_panier: parsedJson['nom_panier'],
      mail_panier: parsedJson['mail_panier'],
      phone_panier: parsedJson['phone_panier'],
      date_panier: parsedJson['date_panier'],
    );
  }
}

Future<Panier> deletePanier(String id) async {
  String user = 'aurore';
  String password = 'JustinMartin';
  String basicAuth= 'Basic '+ base64Encode(utf8.encode('$user:$password'));
  final http.Response response = await http.delete(
    Uri.parse('https://amelisadigital.eu:8443/api/panier/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': basicAuth,
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON. After deleting,
    // you'll get an empty JSON `{}` response.
    // Don't return `null`, otherwise `snapshot.hasData`
    // will always return false on `FutureBuilder`.
    return Panier.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete Panier.');
  }
}
class AdPanier extends StatefulWidget {
  @override
  _AdPanierState createState() => _AdPanierState();
}

class _AdPanierState extends State<AdPanier> {
  late List data;

  Future<List<Panier>> getPanier() async {
    String user = 'aurore';
    String password = 'JustinMartin';
    String basicAuth= 'Basic '+ base64Encode(utf8.encode('$user:$password'));
    final response = await http.get(
      Uri.parse("https://amelisadigital.eu:8443/api/panier"),
      headers:  <String, String>{
        'Content-Type': 'application/json',
        'Authorization': basicAuth ,
      },
    );
    final data1 = json.decode(response.body);
    return (data1 as List).map((e) => Panier.fromJson(e)).toList();
  }


  @override
  void initState() {
    super.initState();
    this.getPanier();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getPanier(),
        builder: (context, snapshot) {
          if (snapshot.hasError)

            print(snapshot.error);
          return snapshot.hasData
              ? ItemList(
            list: snapshot.data as List<Panier>,
          )
              : Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List<Panier> list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 150,
                      width: 550,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 10),
                            Column(
                              children: [
                                SizedBox(height: 25),
                                Text(
                                  list[i].id_panier.toString(),
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green),
                                ),
                                SizedBox(height:10),
                                Text(
                                  list[i].date_panier.toString(),
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54),
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  list[i].nom_panier.toString(),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                TextButton(
                                    onPressed: () {
                                      _launchMail(
                                          list[i].mail_panier.toString());
                                    },
                                 child: Text( list[i].mail_panier.toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blue),
                                )),
                                Text(
                                  list[i].phone_panier.toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blueGrey),
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      deletePanier(list[i].id_panier.toString());
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: TextButton(
                                                  onPressed: () { Navigator.push(context,
                                                    MaterialPageRoute(builder: (context) =>  MyAdmin(validation: true,)),);},
                                                  child: Text("Effacé")),
                                            );
                                          });
                                    },
                                    color: Colors.blue,
                                    highlightColor: Colors.blue,
                                    icon: const FaIcon(
                                      FontAwesomeIcons.circleXmark,
                                      color: Colors.red,
                                      size:15,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      _launchCaller(
                                          list[i].phone_panier.toString());
                                    },
                                    color: Colors.blue,
                                    highlightColor: Colors.blue,
                                    icon: const FaIcon(
                                      FontAwesomeIcons.phone,
                                      color: Colors.green,
                                      size:18,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          );
        });
  }
}
_launchCaller(String url) async {
  if (await canLaunchUrlString('tel:' + url)) {
    await launchUrlString('tel:' + url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchMail(String url) async {
  if (await canLaunchUrlString('mailto:' + url)) {
    await launchUrlString('mailto:' + url);
  } else {
    throw 'Could not launch $url';
  }
}