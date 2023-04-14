import 'package:flutter/material.dart';

import 'adminstration.dart';

class Login extends StatefulWidget {
const Login({Key? key}) : super(key: key);
static const String route = '/admin';
@override
State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body :Center(
          child: Column(
      children: [
             const Text(
               "Acces à la page d'administration",
               style: TextStyle(
                   color: Colors.blue,
                   fontWeight: FontWeight.w500,
                   fontSize: 30),
             ),
            Container(
              width:500,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'enregistrez vous',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              width:500,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nom d'utilisateur",
                ),
              ),
            ),
            Container(
              width:500,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de passe',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('ok'),
                  onPressed: () {
                    if( nameController.text =='auroreJeJ' && passwordController.text=='JustinMartin' ){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>  MyAdmin(validation: true,)),); }
                    else {
                      showDialog(
                       context: context,
                       builder: (context) {
                         return AlertDialog(
                           content: TextButton(child: Text("mauvais mot de passe"), onPressed: () {
                             Navigator.push(context,
                               MaterialPageRoute(builder: (context) =>  const Login()),); }),
                         );
                       },
                     );
                    }

                  },
                )
            ),

      ],
        ),),
        );
  }
}