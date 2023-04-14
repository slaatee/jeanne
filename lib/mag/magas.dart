import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../admin/article/Article.dart';

class MyMagas extends StatefulWidget {
  MyMagas({Key? key, required this.magas}) : super(key: key);
  final String magas;
  @override
  _MyMagasState createState() => _MyMagasState();
}

class _MyMagasState extends State<MyMagas> {
  late List data;

  @override
  void initState() {
    super.initState();
    getArticlebyName(widget.magas);

  }

  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return FutureBuilder<List<Article>>(
        future: getArticlebyName(widget.magas),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article> a = snapshot.data as List<Article>;
            return ListView.builder(
              primary :false,
                shrinkWrap: true,
                itemCount: a.length,
                itemBuilder: (context, index) {
                  if (MediaQuery.of(context).orientation ==
                      Orientation.portrait) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height:45),
                        Text(
                          a[index].titre.toUpperCase(),
                          style: GoogleFonts.merriweatherSans(
                              color: const Color(0xFF33CC99), fontSize: 25.h),
                        ),
                        const SizedBox(height: 10),
                        Container(

                          height:400,
                          width: queryData.size.width -100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(a[index].photo),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                width: 1.5,
                                color: Color(0xFF33CC99),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topCenter,
                          width: queryData.size.width - 100,
                          child: Text(
                            a[index].text,
                            style: GoogleFonts.rochester(
                                color: Colors.black, fontSize: 25.h),
                          ),
                        ),
                        if (a[index].lien.contains("www"))
                          TextButton.icon(
                              onPressed: ()=> launch(a[index].lien),
                              icon: const FaIcon(
                                FontAwesomeIcons.link,
                                color: Color(0xFF33CC99),
                                size: 20,
                              ), label: Text(a[index].lien),),
                        SizedBox(height: 10),
                        Text(
                          "~~~",
                          style: GoogleFonts.rochester(
                              color: Colors.black54, fontSize: 65.h),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height:25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width:25),
                          Container(
                            height: queryData.size.width / 4,
                            width: queryData.size.width / 3,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(a[index].photo),
                                  fit: BoxFit.cover,
                                ),
                               ),
                          ),

                  Container(
                      height: queryData.size.width / 4,
                      width: queryData.size.width / 2.5,
                  decoration: const BoxDecoration(
                  color: Color(0xFFE1E1E1),
                  ),
                          child:Column(
                            children: [
                              const SizedBox(width:25,height: 25,),
                              Text(
                                a[index].titre,
                                style: GoogleFonts.rochester(
                                    color: const Color(0xFF307960), fontSize: 40.w,fontWeight: FontWeight.w500),
                              ),

                              SizedBox(width:20,height: 20),
                              Container(

                                padding: EdgeInsets.all(10) ,
                                alignment: Alignment.topCenter,
                                width: queryData.size.width - queryData.size.width /1.5,
                                child: Text(
                                  a[index].text,
                                  style: GoogleFonts.merriweatherSans(
                                      color: Colors.black, fontSize: 20.w,fontWeight: FontWeight.w100 ),
                                ),
                              ),
                              if (a[index].lien.contains("www") )
                                TextButton.icon(
                                  onPressed: ()=> launch(a[index].lien),
                                  icon: const FaIcon(
                                    FontAwesomeIcons.link,
                                    color: Color(0xFF33CC99),
                                    size: 20,
                                  ), label: Text(a[index].lien),),
                            ],
                          )
                  ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const SizedBox(
            width:50,
            height:50,
              child: CircularProgressIndicator()
          );

        });
  }
}
