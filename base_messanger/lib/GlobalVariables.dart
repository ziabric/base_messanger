import 'package:flutter/material.dart';

List<(String, String)> messageList = [];

var messageController = TextEditingController();

String myId = "id1";
String otherId = "";
var loginController = TextEditingController();
var passController = TextEditingController();
bool loginFlag = true;

bool messPageNeedUpdate = false;

/* Sign up */
/* ============================== */

var niknameController_ = TextEditingController();
var fNameController_ = TextEditingController();
var lNameController_ = TextEditingController();
var loginController_ = TextEditingController();
var passController_ = TextEditingController();

/* Drawer */
/* ============================== */

String userName = "";
String fio = "";

/* Settings */
/* ============================== */

List<String> backs = ['assets/backs/back1.jpg', "assets/backs/back2.jpg", "assets/backs/back3.jpg", "assets/backs/back4.jpg"];
int currentBack = 0;

int fontSize = 20;

/* ============================== */

List<String> contacts = ["id1", "id2", "id3", "id4", "id5", "id6", "id6", "id7", "id8", "id9", "id10"];