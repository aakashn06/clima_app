import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
   var url;
   NetworkHelper(this.url);

  Future getData(url) async {

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }

}
