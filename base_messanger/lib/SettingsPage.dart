import 'package:flutter/material.dart';
import 'package:base_messanger/GlobalVariables.dart' as gv;

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {


    List<Widget> wallpepar = [];
    for (int i = 0; i < gv.backs.length; i+=1) {
      wallpepar.add(
        TextButton(
            onPressed: () {
              gv.currentBack = i;
            }, 
            child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(gv.backs[i])
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue
            ),
            height: 200,
            width: 200,
          ),
          ),
      );
    }

    return Scaffold(
      body: MaterialApp(
      home: ListView(
        children: [
          const DefaultTextStyle(
            style: TextStyle(color: Colors.blue, fontSize: 35), 
            child: Center(child: Text("Wallpepar")),
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: wallpepar),
            )
          ),
        const DefaultTextStyle(
          style: TextStyle(color: Colors.blue, fontSize: 35),
          child: Center(child: Text(
            "Font size",
          ),)
        ),
        Slider(
            value: gv.fontSize.toDouble(),
            min: 10,
            max: 60,
            onChanged: (value) {
              gv.fontSize = value.toInt();
              setState(() {
                
              });
            },
          ),
        ],
      )
      ),
    );
  }
}
