import 'dart:convert';
import 'package:http/http.dart' as http;

class Questions {
  var url = "http://www.mocky.io/v2/5ebd2f5f31000018005b117f";
  Future grabQuestions() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      //print(jsonDecode(data));
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
