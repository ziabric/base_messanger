import 'package:flutter/material.dart';
import 'package:base_messanger/GlobalVariables.dart' as gv;

class MessPage extends StatefulWidget {
  @override
  MessPageState createState() => MessPageState();
}

class MessPageState extends State<MessPage> {
  ScrollController listViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text(gv.otherId),),
          ),
          body: Column(
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(gv.backs[gv.currentBack]),
                        scale: 1,
                        opacity: 0.3,
                        repeat: ImageRepeat.repeat)),
                child: ListView.builder(
                  controller: listViewController,
                  itemCount: gv.messageList.length,
                  itemBuilder: (context, index) {
                    final item = gv.messageList[index];

                    if (item.$1 == gv.myId) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.centerRight,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            item.$2,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    } else if (item.$1 == gv.otherId) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            item.$2,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              )),
              Container(
                color: Colors.blueAccent,
                child: Container(
                  margin: const EdgeInsets.only(left: 10, bottom: 15),
                  child: Row(
                    children: [
                      Container(
                        child: Expanded(
                          child: TextField(
                              controller: gv.messageController,
                              decoration: const InputDecoration(
                                  hintText: "Message",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                              maxLines: 10,
                              minLines: 1),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                            onPressed: () {
                              print("Send message");
                              String text = gv.messageController.text;
                              gv.messageList.add(("id1", text));
                              gv.messageController.text = '';
                              listViewController.animateTo(
                                  listViewController.position.maxScrollExtent +
                                      10000000000000000,
                                  curve: Curves.fastOutSlowIn,
                                  duration: const Duration(milliseconds: 10));
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.arrow_circle_up,
                              color: Colors.white,
                              size: 50,
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
