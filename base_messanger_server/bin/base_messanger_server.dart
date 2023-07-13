import 'package:sqlite3/sqlite3.dart';
import 'dart:convert' show json;

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

Future<Response> handleRequest(Request request) async {
  String dbPath = "dbforsever";

  print(request.requestedUri.path);

  switch (request.requestedUri.path) {

    case "/ping":
      {
        return Response.ok(await request.readAsString());
      }

    case "/createAccount":
      {
        String output = '';
        String errorString = 'false';

        Map<String, dynamic> jsonBody = json.decode(await request.readAsString());

        String nikname_ = jsonBody["nikname"];
        String login_ = jsonBody["login"];
        String pass_ = jsonBody["pass"];
        String fName_ = jsonBody["fName"];
        String lName_ = jsonBody["lName"];

        var db = sqlite3.open(dbPath);

        db.execute("""INSERT INTO users(nikname_, login_, pass_, firstname_, lastname_) VALUES ('$nikname_', '$login_', '$pass_', '$fName_', '$lName_');""");

        db.dispose();

        
        return Response.ok("""{"id" : "$output", "error": "$errorString"}""");
      }
    
    case "/deleteAccount":
      {
        String output = '';
        String errorString = 'false';

        Map<String, dynamic> jsonBody = json.decode(await request.readAsString());

        String nikname_ = jsonBody["nikname"];

        var db = sqlite3.open(dbPath);

        db.execute("""DELETE FROM users WHERE nikname_="$nikname_";""");

        db.dispose();

        return Response.ok("""{"id" : "$output", "error": "$errorString"}""");
      }

    case "/auth":
      {
        String output = '';
        String errorString = 'false';

        Map<String, dynamic> jsonBody =
            json.decode(await request.readAsString());

        String login = jsonBody["login"].toString();
        String pass = jsonBody["pass"].toString();

        var db = sqlite3.open(dbPath);
        var result = db.select("select rowid, login_, pass_ from users;");

        for (var item in result) {
          if (item.values[1] == login && item.values[2] == pass) {
            output = item.values[0].toString();
            break;
          }
        }

        db.dispose();

        return Response.ok("""{"id" : "$output", "error": "$errorString"}""");
      }
    
    
  }

  return Response.ok("""{"error" : "true"}""");
}

void main(List<String> arguments) async {



  var handler = const Pipeline().addHandler(handleRequest);

  await io.serve(handler, 'localhost', 4044);

  print('Start!');
}