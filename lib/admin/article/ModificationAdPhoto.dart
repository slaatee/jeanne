
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jeanneetjean/admin/article/drop.dart';
import 'Article.dart';
import '../adminstration.dart';
import 'ajoutPhoto.dart';


class modifAdP extends StatefulWidget {
  modifAdP({Key? key, required this.article, required this.photo}) : super(key: key);
  final Article article;
  final String photo;

  @override
  _ModifAdPState createState() => _ModifAdPState();
}

class _ModifAdPState extends State<modifAdP> {
  //controller
  TextEditingController controllerTitre = TextEditingController();
  TextEditingController controllerText = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerLien = TextEditingController();
  TextEditingController controllerPhoto = TextEditingController();


  //form
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 500,
          padding: EdgeInsets.all(15),
          child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Modification Photo",style: GoogleFonts.merriweatherSans(fontSize:18, color: Colors.blueGrey),),

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
                          return 'rentrez un lien';
                        }
                        return null;
                      },
                    ),

                    Image.network(
                      widget.photo,
                      height: 200, width: 300),
                    SizedBox(height:10),
                    MaterialButton(

                        color: Colors.blue,
                        child: const Text(
                            "ajouter une image",
                            style: TextStyle(
                                color: Colors.white70, fontWeight: FontWeight.bold
                            )
                        ),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  ajoutPhoto(article: widget.article,)),);
                        }
                    ),
                    SizedBox(height:10),
                    MaterialButton(

                        color: Colors.blue,
                        child: const Text(
                            "choisir image",
                            style: TextStyle(
                                color: Colors.white70, fontWeight: FontWeight.bold
                            )
                        ),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  MyDrop(article: widget.article,)),);
                        }
                    ),

                    const Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    Row(
                      children: [
                        FloatingActionButton.extended(
                          heroTag: null,
                          onPressed: () => {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  MyAdmin(validation: true,)),)
                        },

                          label: const Text(
                            "acceuil admin",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          backgroundColor: Colors.red,
                          elevation: 4,
                          icon: const Icon(
                            Icons.arrow_circle_left,
                            color: Colors.white,
                          ),
                        ),
                        FloatingActionButton.extended(
                          heroTag: null,
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
                        SizedBox(width: 25),
                        FloatingActionButton.extended(
                          heroTag: null,
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
                                          photo: widget.photo));
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
