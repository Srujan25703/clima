import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper{
  NetworkHelper({required this.url});
  final String url;

  Future getData() async{
    final res = await http.get(Uri.parse(url),
    );
    if (res.statusCode == 200) {
      String data = res.body;
      print(res.statusCode);
      print(data);
      return jsonDecode(data);
    } else {
      print('Failed to load data: ${res.statusCode}');
    }
  }
}