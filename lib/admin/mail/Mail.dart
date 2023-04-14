import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class Mail {
  final String recipient;
  final String msgBody;
  final String subject;


  Mail(
      {required this.recipient,
        required this.msgBody,
        required this.subject});

  factory Mail.fromJson(Map<String, dynamic> parsedJson) {
    return Mail(
      recipient: parsedJson['recipient'],
      msgBody: parsedJson['msgBody'],
      subject: parsedJson['subject'],
    );
  }
}

Future<Mail> postMail(Mail mail) async {
  String user = 'aurore';
  String password = 'JustinMartin';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$password'));

  final http.Response response = await http.post(
    Uri.parse('https://amelisadigital.eu:8443/sendMail'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': basicAuth,
    },
    body: jsonEncode(<String, dynamic>{
     'recipient': mail.recipient,
      'msgBody': mail.msgBody,
      'subject': mail.subject,
    }),
  );

  if (response.statusCode == 200) {
    return Mail.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post.');
  }
}

