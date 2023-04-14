import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:jeanneetjean/admin/article/drop.dart';
import 'Article.dart';
import '../adminstration.dart';
import 'ajoutPhoto.dart';


class modifAd extends StatefulWidget {
  modifAd({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  _ModifAdState createState() => _ModifAdState();
}

class _ModifAdState extends State<modifAd> {
  //controller
  TextEditingController controllerTitre = TextEditingController();
  TextEditingController controllerText = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerLien = TextEditingController();
  TextEditingController controllerPhoto = TextEditingController();

  //form
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Uint8List? fileBytes;
  String? nom;
  String? reponse;
  late String Photo;

  @override
  void initState() {
    super.initState();
    Photo= widget.article.photo;
  }
//pick
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
      upload();
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }

  }
//upload
  Future upload() async {
    String user = 'aurore';
    String password = 'JustinMartin';
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$user:$password'))}';
    var uri = Uri.parse("https://amelisadigital.eu:8443/api/uploadfile");
    Map<String, String> headers = {
      "Authorization": basicAuth,
      "content-type": "multipart/form-data"
    };
    setState(() {
      Photo = 'https://www.magasinalaferme.fr/assets/images/jej/loading.gif';
    });
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromBytes('file', fileBytes!, filename: nom!));
    var response = await request.send();
    print(response.statusCode);
    print(response.reasonPhrase);
    response.stream.transform(utf8.decoder).listen((value) {
      setState(() => reponse = "photo bien envoyé");
      print(value);
      setState(() {
        Photo = 'https://www.magasinalaferme.fr/assets/images/jej/'+nom!;
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child:Card(
        child: Container(
          width: 800,
          padding: EdgeInsets.all(15),
          child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Modification",style: GoogleFonts.merriweatherSans(fontSize:18, color: Colors.blueGrey),),

                    TextFormField(
                      controller: controllerTitre..text = widget.article.titre,
                      cursorColor: Colors.blue,
                      maxLines: null,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.title),
                        labelText: 'Titre',

                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6200EE)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'rentrez un titre';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controllerDate..text = widget.article.date,
                      cursorColor: Colors.blue,
                      maxLines: null,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.text_fields),
                        labelText: 'Date',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6200EE)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'rentrez une Date';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controllerText..text = widget.article.text,
                      cursorColor: Colors.blue,
                      maxLines: null,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.text_fields),
                        labelText: 'Text',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6200EE)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'rentrez un texte';
                        }
                        return null;
                      },
                    ),
                    if(widget.article.nom != "agrikolis")
                    TextFormField(
                      controller: controllerLien..text = widget.article.lien,
                      cursorColor: Colors.blue,
                      maxLines: null,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.text_fields),
                        labelText: 'Lien',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6200EE)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'rentrez un lien, ou null si pas de lien!';
                        }
                        return null;
                      },
                    ),
                    Image.network(
                        Photo,
                        height: 200, width: 300),
                    MaterialButton(
                        color: Colors.blue,
                        child: const Text(
                            "ajouter une image",
                            style: TextStyle(
                                color: Colors.white70, fontWeight: FontWeight.bold
                            )
                        ),
                        onPressed: () {
                          pickImage();
                        }
                    ),
                  if(reponse!=null)
                    Text(reponse.toString()),
                  const SizedBox(height:20),
                    MaterialButton(
                        color: Colors.blue,
                        child: const Text(
                            "Modifier une image",
                            style: TextStyle(
                                color: Colors.white70, fontWeight: FontWeight.bold
                            )
                        ),
                        onPressed: () {
                              Article arti ;
                              arti = Article(
                                  id: widget.article.id,
                                  nom: widget.article.nom,
                                  titre: controllerTitre.text,
                                  date: controllerDate.text,
                                  text: controllerText.text,
                                  lien: controllerLien.text,
                                  photo: Photo);
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  MyDrop(article: arti,)),);
                        }
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton.extended(
                          onPressed: () => {
                            Navigator.pop(context),

                          },
                          label: const Text(
                            "retour",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          backgroundColor: Colors.red,
                          elevation: 4,
                          icon: const Icon(
                            Icons.arrow_circle_left,
                            color: Colors.white,
                          ),
                        ),
                       const  SizedBox(width: 25),
                        FloatingActionButton.extended(
                          onPressed: () => {
                            if (_formKey.currentState!.validate())
                              {
                                setState(() {
                                  modifyArticle(
                                      widget.article.id,
                                      Article(
                                          id: widget.article.id,
                                          nom: widget.article.nom,
                                          titre: controllerTitre.text,
                                          date: controllerDate.text,
                                          text: controllerText.text,
                                          lien: controllerLien.text,
                                          photo: Photo));
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: TextButton(child: Text("bien envoyé OK"), onPressed: () {
                                          Navigator.push(context,
                                            MaterialPageRoute(builder: (context) =>  MyAdmin(validation: true,)),); }),
                                      );
                                    },
                                  );
                                })
                              },


                          },
                          label: const Text(
                            "modifier",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          backgroundColor: Colors.teal,
                          elevation: 4,
                          icon: const Icon(
                            Icons.arrow_circle_right,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ])),
        ),
      ),
    );
  }

}
