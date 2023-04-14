import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../article/Article.dart';
import '../article/Article.dart';
import '../article/Article.dart';
import '../article/ModificationAd.dart';

class TextAd extends StatefulWidget {
  TextAd({Key? key, required this.menu}) : super(key: key);
  final String menu;
  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<TextAd> {
 late List data;

  @override
  void initState() {
    super.initState();
    getArticlebyName(widget.menu);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(

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
                                  children:[
                                    const SizedBox(height:25),
                                             Row(
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(width: 10),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Catégorie: ${a[index].nom}",
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.black54),
                                                      ),
                                                      const SizedBox(height: 10),
                                                      Container(
                                                        width: queryData.size.width/1.7,
                                                        padding: EdgeInsets.all(1.0),
                                                        child: Text(
                                                          a[index].text.toString(),
                                                          style:
                                                          TextStyle(fontSize: 12,
                                                              color: Colors.black),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 10,
                                                        ),
                                                      ),
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
                                                     const SizedBox(height: 10),
                                                      Row(
                                                        children: [
                                                          TextButton.icon(
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
                                                            color: Colors.blue,), label: const Text("modifier"),),

                                                        ],
                                                      ),

                                                    ],
                                                  ),
                                                ],
                                              ),


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
                      child:CircularProgressIndicator()
                        );
                      }
    ),
    );
  }
}


