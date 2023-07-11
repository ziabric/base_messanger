import 'package:flutter/material.dart';
import 'package:base_messanger/MessPage.dart';
import 'package:base_messanger/GlobalVariables.dart' as gv;
import 'package:base_messanger/SettingsPage.dart';
import 'package:base_messanger/LoginPage.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  ScrollController listViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(gv.myId)),
          drawer: Drawer(
              child: Column(
            children: [
              Container(
                height: 100,
              ),
              TextButton(
                  onPressed: () {},
                  child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        boxShadow: const [
                        BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.black38,
                            blurRadius: 3)
                      ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.account_circle_rounded,
                              size: 75,
                              color: Colors.blue,
                            ),
                            Container(
                              height: 100,
                            )
                          ],
                        ),
                      ))),
              
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.black38,
                            blurRadius: 3)
                      ],
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Settings",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    gv.loginFlag = false;
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.black38,
                            blurRadius: 3)
                      ],
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Exit",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              TextButton(
                  onPressed: () {

                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.black38,
                            blurRadius: 3)
                      ],
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "About",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          )),
          body: ListView.builder(
            itemCount: gv.contacts.length,
            itemBuilder: (context, index) => TextButton(
              onPressed: () {
                gv.otherId = gv.contacts[index];
                Navigator.push(context, MaterialPageRoute(builder: (context) => MessPage()));
              }, 
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue
                ),
              child: Row(
                children: [
                  Container(width: 10,),
                  const Icon(Icons.account_circle_rounded, color: Colors.white, size: 60,),
                  Container(width: 10,),
                  Text(
                    gv.contacts[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  )
                ],
              )
            )
            )
          ),
      )
    );
  }
}