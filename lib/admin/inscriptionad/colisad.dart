import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';

import '../adminstration.dart';

class Colis {
  final int? id_colis;
  final String? nom_colis;
  final String? mail_colis;
  final String? phone_colis;
  final String? date_colis;

  Colis({
    required this.id_colis,
    required this.nom_colis,
    required this.mail_colis,
    required this.phone_colis,
    required this.date_colis,
  });

  factory Colis.fromJson(Map<String, dynamic> parsedJson) {
    return Colis(
      id_colis: parsedJson['id_colis'],
      nom_colis: parsedJson['nom_colis'],
      mail_colis: parsedJson['mail_colis'],
      phone_colis: parsedJson['phone_colis'],
      date_colis: parsedJson['date_colis'],
    );
  }
}

Future<Colis> deleteColis(String id) async {
  String user = 'aurore';
  String password = 'JustinMartin';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$password'));
  final http.Response response = await http.delete(
    Uri.parse('https://amelisadigital.eu:8443/api/colis/$id'),
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
    return Colis.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete colis.');
  }
}

class AdColis extends StatefulWidget {
  @override
  _AdColisState createState() => _AdColisState();
}

class _AdColisState extends State<AdColis> {
  late List data;
  bool isChecked = false;
  Future<List<Colis>> getColis() async {
    String user = 'aurore';
    String password = 'JustinMartin';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$password'));
    final response = await http.get(
      Uri.parse("https://amelisadigital.eu:8443/api/colis"),
      headers: <String, String>{
        "Content-Type": "application/json",
        'Authorization': basicAuth,
      },
    );
    final data1 = json.decode(response.body);
    return (data1 as List).map((e) => Colis.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    getColis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getColis(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data as List<Colis>,
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
  final List<Colis> list;

  ItemList({required this.list});
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Container(
                padding: EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
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
                                list[i].id_colis.toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.green),
                              ),
                              SizedBox(height: 10),
                              Text(
                                list[i].date_colis.toString(),
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
                                list[i].nom_colis.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              TextButton(
                                  onPressed: () {
                                    _launchMail(list[i].mail_colis.toString());
                                  },
                                  child: Text(
                                    list[i].mail_colis.toString(),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                  )),
                              Text(list[i].phone_colis.toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blueGrey)),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    deleteColis(list[i].id_colis.toString());
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
                                    size: 15,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    _launchCaller(
                                        list[i].phone_colis.toString());
                                  },
                                  color: Colors.blue,
                                  highlightColor: Colors.blue,
                                  icon: const FaIcon(
                                    FontAwesomeIcons.phone,
                                    color: Colors.green,
                                    size: 18,
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
      },
    );
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
