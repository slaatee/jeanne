import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';

import '../adminstration.dart';

class Visite {
  final int? id_visite;
  final String? nom_visite;
  final String? mail_visite;
  final String? phone_visite;
  final String? date_visite;

  Visite(
      {required this.id_visite,
        required this.nom_visite,
        required this.mail_visite,
        required this.phone_visite,
        required this.date_visite});

  factory Visite.fromJson(Map<String, dynamic> parsedJson) {
    return Visite(
      id_visite: parsedJson['id_visite'],
      nom_visite: parsedJson['nom_visite'],
      mail_visite: parsedJson['mail_visite'],
      phone_visite: parsedJson['phone_visite'],
      date_visite: parsedJson['date_visite'],
    );
  }
}
Future<Visite> deleteVisite(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('http://51.178.86.78:8080/api/visite/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON. After deleting,
    // you'll get an empty JSON `{}` response.
    // Don't return `null`, otherwise `snapshot.hasData`
    // will always return false on `FutureBuilder`.
    return Visite.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete visite.');
  }
}

Future<Visite> deleteColis(String id) async {
  String user = 'aurore';
  String password = 'JustinMartin';
  String basicAuth= 'Basic '+ base64Encode(utf8.encode('$user:$password'));
  final http.Response response = await http.delete(
    Uri.parse('https://amelisadigital.eu:8443/api/visite/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': basicAuth ,
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON. After deleting,
    // you'll get an empty JSON `{}` response.
    // Don't return `null`, otherwise `snapshot.hasData`
    // will always return false on `FutureBuilder`.
    return Visite.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete visite.');
  }
}
class AdVisite extends StatefulWidget {
  @override
  _AdVisiteState createState() => _AdVisiteState();
}

class _AdVisiteState extends State<AdVisite> {
  late List data;

  Future<List<Visite>> getVisite() async {
    String user = 'aurore';
    String password = 'JustinMartin';
    String basicAuth= 'Basic '+ base64Encode(utf8.encode('$user:$password'));
    final response = await http.get(
      Uri.parse("https://amelisadigital.eu:8443/api/visite"),
      headers: {"Content-Type": "application/json",
        'Authorization': basicAuth ,},
    );
    final data1 = json.decode(response.body);
    return (data1 as List).map((e) => Visite.fromJson(e)).toList();
  }


  @override
  void initState() {
    super.initState();
    this.getVisite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getVisite(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(
            list: snapshot.data as List<Visite>,
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
  final List<Visite> list;
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
                                  list[i].id_visite.toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  list[i].date_visite.toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  list[i].nom_visite.toString(),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _launchMail(
                                        list[i].mail_visite.toString());
                                  },
                                  child: Text(
                                  list[i].mail_visite.toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blue),
                                )),
                                Text(
                                  list[i].phone_visite.toString(),
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
                                      deleteVisite(list[i].id_visite.toString());
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
                                          list[i].phone_visite.toString());
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