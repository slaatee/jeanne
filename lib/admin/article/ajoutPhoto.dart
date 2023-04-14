import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'Article.dart';
import 'dart:async';



import 'ModificationAdPhoto.dart';

class ajoutPhoto extends StatefulWidget {
  ajoutPhoto({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  _ajoutPhotoState createState() => _ajoutPhotoState();
}

class _ajoutPhotoState extends State<ajoutPhoto> {
  Uint8List? fileBytes;
  String? nom;
  String? reponse;
  @override
  void initState() {
    super.initState();
  }

  final ImagePicker picker = ImagePicker();
  Future pickImage() async {
    try {
      final XFile? imageFile = await picker.pickImage(
        source: ImageSource.gallery,
          imageQuality: 25,
      );

      if (imageFile == null) return;
      fileBytes = await imageFile.readAsBytes();
      final nom = imageFile.name;
      setState(() => this.nom = nom);
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  Future upload() async {
    String user = 'aurore';
    String password = 'JustinMartin';
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$user:$password'))}';
    var uri = Uri.parse("https://amelisadigital.eu:8443/api/uploadfile");
    Map<String, String> headers = {
      "Authorization": basicAuth,
      "content-type": "multipart/form-data"
    };

    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromBytes('file', fileBytes!, filename: nom!));
    var response = await request.send();
    print(response.statusCode);
    print(response.reasonPhrase);
    response.stream.transform(utf8.decoder).listen((value) {
        setState(() => this.reponse = "photo bien envoyé");
        print(value);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Card(
       child: Container(
        width:600,
        child: Column(
          children: [
            SizedBox(height: 150),
            MaterialButton(
                color: Colors.blue,
                child: const Text("ajouter une image",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                onPressed: () {
                  pickImage();

                }),
            SizedBox(height: 50),
            if (nom != null)
              MaterialButton(
                  color: Colors.red,
                  child: const Text("upload image et attendez la validation",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    upload();
                  }),
            SizedBox(height: 50,),
            if (reponse != null)
              Text(reponse!,
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
            SizedBox(height: 50,),
           if (reponse != null)
              MaterialButton(
                  color: Colors.red,
                  child: const Text("continuer",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                        context,
                    MaterialPageRoute(
                        builder: (
                        context) =>
                    modifAdP(article: widget.article, photo:'https://www.magasinalaferme.fr/assets/images/jej/'+nom!)));
                    }),
          ],
        ),
      ),
      ),
    );
  }
}
