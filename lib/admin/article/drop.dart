import 'package:flutter/material.dart';
import 'package:jeanneetjean/admin/article/Article.dart';
import 'package:jeanneetjean/admin/article/ModificationAdPhoto.dart';

class MyDrop extends StatefulWidget {
  const MyDrop({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  State<MyDrop> createState() => _MyDropState();
}

class _MyDropState extends State<MyDrop> {
  late List data;

  @override
  void initState() {
    super.initState();
    getFile();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
            future: getFile(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List? a = snapshot.data;
                if (MediaQuery.of(context).orientation == Orientation.portrait) {
                  return GridView.builder(

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,mainAxisSpacing: 20,
                  ),
                  itemCount: a?.length,
                  itemBuilder: (context, index) {
                    return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.magasinalaferme.fr/assets/images/jej/" +

                                        a?[index]),
                                fit: BoxFit.cover)),
                        child: Column(
                          children: [
                            SizedBox(height:25),
                            TextButton(
                              style: ButtonStyle(
                               backgroundColor: MaterialStateProperty.all(Colors.teal),
                              ),
                              onPressed: () {},
                              child: Text(
                                a![index],
                                style:const  TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height:25),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                primary:Colors.red),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => modifAdP(
                                        article: widget.article,
                                        photo:
                                            'https://www.magasinalaferme.fr/assets/images/jej/'+a[index],
                                      ),
                                    ),
                                  );
                                },
                                child:  const Text("choisir",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))
                            ),
                          ],
                        ),

                    );
                  },
                );
                }
                else{
                  return GridView.builder(

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,mainAxisSpacing: 20,
                    ),
                    itemCount: a?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.magasinalaferme.fr/assets/images/jej/" +
                                        a?[index]),
                                fit: BoxFit.cover)),
                        child: Column(
                          children: [
                            SizedBox(height:25),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.teal),
                              ),
                              onPressed: () {},
                              child: Text(
                                a![index],
                                style:const  TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height:25),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary:Colors.red),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => modifAdP(
                                        article: widget.article,
                                        photo:
                                        'https://www.magasinalaferme.fr/assets/images/jej/'+a[index],
                                      ),
                                    ),
                                  );
                                },
                                child:  const Text("choisir",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))
                            ),
                          ],
                        ),

                      );
                    },
                  );
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            });

  }
}
