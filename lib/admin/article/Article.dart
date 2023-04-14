import 'dart:convert';
import 'package:http/http.dart' as http;


class Article {
  final int id;
  final String nom;
  final String titre;
  final String date;
  final String text;
  final String lien;
  late final String photo;


  Article(
      {required this.id,
        required this.nom,
        required this.titre,
        required this.date,
        required this.text,
        required this.lien,
        required this.photo});

  factory Article.fromJson(Map<String, dynamic> parsedJson) {
    return Article(
      id: parsedJson['id'],
      nom: parsedJson['nom'],
      titre: parsedJson['titre'],
      date: parsedJson['date'],
      text: parsedJson['text'],
      lien: parsedJson['lien'],
      photo: parsedJson['photo'],
    );
  }
}
Future<Article> deleteArticle(String id) async {
  String user = 'aurore';
  String password = 'JustinMartin';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$password'));
  final http.Response response = await http.delete(
    Uri.parse('https://amelisadigital.eu:8443/api/article/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': basicAuth,
    },
  );
  if (response.statusCode == 200) {
    return Article.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception('Failed to delete Article.');
  }
}

Future<Article> modifyArticle(int id, Article article) async {
  String user = 'aurore';
  String password = 'JustinMartin';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$password'));

  final http.Response response = await http.put(
    Uri.parse('https://amelisadigital.eu:8443/api/article/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': basicAuth,
    },
    body: jsonEncode(<String, dynamic>{
      'id': article.id,
      'nom': article.nom,
      'titre': article.titre,
      'date': article.date,
      'text': article.text,
      'lien': article.lien,
      'photo': article.photo
    }),
  );

  if (response.statusCode == 200) {
    return Article.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception('Failed to post Article.');
  }
}
Future<Article> addArticle(Article article) async {
  String user = 'aurore';
  String password = 'JustinMartin';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$password'));

  final http.Response response = await http.post(
    Uri.parse('https://amelisadigital.eu:8443/api/article/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': basicAuth,
    },
    body: jsonEncode(<String, dynamic>{
      'id': article.id,
      'nom': article.nom,
      'titre': article.titre,
      'date': article.date,
      'text': article.text,
      'lien': article.lien,
      'photo': article.photo
    }),
  );

  if (response.statusCode == 200) {
    return Article.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post Article.');
  }
}
Future<List<Article>> getArticlebyName(String name) async {
  String user = 'aurore';
  String password = 'JustinMartin';
  String basicAuth= 'Basic '+ base64Encode(utf8.encode('$user:$password'));
  final response = await http.get(
    Uri.parse("https://amelisadigital.eu:8443/api/article"),
    headers:  <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': basicAuth ,
    },
  );
  final data1 = json.decode(utf8.decode(response.bodyBytes));
  List<Article> data2 =(data1 as List).map((e) => Article.fromJson(e)).toList();
  data2.retainWhere((element) =>element.nom ==(name));
  return data2;
}


Future<List> getFile() async {
  String user = 'aurore';
  String password = 'JustinMartin';
  String basicAuth= 'Basic '+ base64Encode(utf8.encode('$user:$password'));
  final response = await http.get(
    Uri.parse("https://amelisadigital.eu:8443/api/getfile"),
    headers:<String,String> {
      "Content-Type": "application/json",
      'Authorization': basicAuth ,},
  );
  final data = json.decode(response.body);
  List data2 =(data as List).map((e) =>(e)).toList();
  return data2;
}
