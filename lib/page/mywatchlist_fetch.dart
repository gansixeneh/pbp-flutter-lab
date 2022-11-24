import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';

Future<List<Mywatchlist>> fetchMywatchList() async {
    var url = Uri.parse(
        'http://tugas2-gansixeneh-2106629963.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<Mywatchlist> listToDo = [];
    for (var d in data) {
      if (d != null) {
        listToDo.add(Mywatchlist.fromJson(d));
      }
    }

    return listToDo;
  }