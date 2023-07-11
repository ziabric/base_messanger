import 'package:base_messanger/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:base_messanger/GlobalVariables.dart' as gv;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: MaterialApp(
              home: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: Container(
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.black38,
                            blurRadius: 3)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  width: 300,
                  height: 300,
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 40, bottom: 20),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Expanded(
                            child: TextField(
                          decoration: const InputDecoration(hintText: "Login"),
                          controller: gv.loginController,
                        )),
                        Expanded(
                            child: TextField(
                          decoration:
                              const InputDecoration(hintText: "Password"),
                          controller: gv.passController,
                        )),
                        Row(
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                          onPressed: () {
                            if (gv.loginController.text == "login1" && gv.passController.text == "pass1") {
                              gv.loginFlag = true;
                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MaterialApp(home: MainPage(),)));
                            }
                          },
                          child: const Text("Sign in")
                        ),
                          ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context, 
                              builder: (context) => AlertDialog(
                                title: const Text("Create account"),
                                actions: [
                                  TextField(
                                    controller: gv.niknameController_,
                                    decoration: const InputDecoration(hintText: "Nikname"),
                                  ),
                                  TextField(
                                    controller: gv.fNameController_,
                                    decoration: const InputDecoration(hintText: "First name"),
                                  ),
                                  TextField(
                                    controller: gv.lNameController_,
                                    decoration: const InputDecoration(hintText: "Last name"),
                                  ),
                                  TextField(
                                    controller: gv.loginController_,
                                    decoration: const InputDecoration(hintText: "Login"),
                                  ),
                                  TextField(
                                    controller: gv.passController_,
                                    decoration: const InputDecoration(hintText: "Password"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {

                                    }, 
                                    child: const Text("Create")
                                  )
                                ],
                              )
                            );
                          },
                          child: const Text("Sign up")
                        ),
                        )
                        ],
                        )
                      ],
                    ),
                  ))),
            )
    );
  }
}
