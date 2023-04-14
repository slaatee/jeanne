import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../adminstration.dart';
import '../article/Article.dart';
import '../article/ModificationAd.dart';

class Ad extends StatefulWidget {
  Ad({Key? key, required this.menu}) : super(key: key);
  final String menu;
  @override
  _AdState createState() => _AdState();
}

class _AdState extends State<Ad> {

  late List data;


  @override
  void initState() {
    super.initState();
    getArticlebyName(widget.menu);
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
           return  Scaffold(
             body:FutureBuilder<List<Article>>(
                      future: getArticlebyName(widget.menu),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Article> a = snapshot.data as List<Article>;
                          return ListView.builder(
                              primary :false,
                              shrinkWrap: true,
                              itemCount: a.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 25),
                                       Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(width: 10),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Catégorie : ${a[index].nom}",
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.black54),
                                                      ),
                                                      Text(
                                                        a[index].date.toString(),
                                                        style:
                                                        const TextStyle(fontSize: 12,
                                                            color: Colors
                                                                .deepPurple),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      Text(
                                                        "Titre: ${a[index].titre}",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.deepOrangeAccent),
                                                      ),
                                                      const SizedBox(height:10),
                                                      const Text("Texte :", style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.teal),),
                                                      const SizedBox(height:5),
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: queryData.size.width/1.7,
                                                        padding: EdgeInsets.all(1.0),
                                                        child: Text(
                                                          a[index].text.toString(),
                                                          style:
                                                          const TextStyle(fontSize: 14,
                                                              color: Colors.black),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 10,
                                                        ),
                                                      ),
                                                      const SizedBox(height:10),
                                                      Container(
                                                        height:300,
                                                        width:300,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image:   NetworkImage(a[index].photo.toString(),),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      Row(
                                                        children: [
                                                         TextButton.icon(
                                                           label: const Text("effacer",style: TextStyle(
                                                             color: Colors.red,//for text color
                                                           ),),

                                                           onPressed: () {
                                                            deleteArticle(a[index]
                                                                .id.toString());
                                                            showDialog(
                                                              context: context,
                                                              builder: (context) {
                                                                return AlertDialog(
                                                                  content: TextButton(child: Text("Effacé"), onPressed: () {
                                                                    Navigator.push(context,
                                                                      MaterialPageRoute(builder: (context) =>  MyAdmin(validation: true,)),); }),
                                                                );
                                                              },
                                                            );
                                                          }, icon: const FaIcon(
                                                            FontAwesomeIcons
                                                                .circleXmark,
                                                            size: 18,
                                                            color: Colors.red,), ),
                                                          TextButton.icon(
                                                              label: const Text("modifier"),
                                                              onPressed: () {
                                                            Article a1 = a[index];
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (
                                                                    context) =>
                                                                    modifAd(
                                                                        article: a1),
                                                              ),
                                                            );
                                                          }, icon: const FaIcon(
                                                            FontAwesomeIcons.pencil,
                                                            size: 18,
                                                            color: Colors.blue,)),
                                                        ],
                                                      ),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                    const SizedBox(height:50),
                                    TextButton.icon(
                                        onPressed: ()
                                        {
                                          Article a= Article(id: 1, nom: widget.menu, titre: "", date:formatter, text: "", lien: "", photo: "");
                                          setState(() {
                                            addArticle(a);
                                          });
                                        },
                                        label: const Text('Ajouter un article'),
                                        icon: const FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 20,
                                          color: Colors.teal,)),
                                    const SizedBox(height:50),
                                  ],
                                );
                              }
                          );
                        }
                        else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const SizedBox(
                            height: 50.0,
                            width: 50.0,
                            child: CircularProgressIndicator()
                        );

                      }),


            );

  }
}


