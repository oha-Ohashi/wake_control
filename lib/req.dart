import 'package:http/http.dart' as http;

String a(){
  return "abc";
}

Future<String> fetchData(Map<String, String> param) async {
  final uri = Uri.parse('https://script.google.com/macros/s/AKfycbw1vFZkWQAwNSr31naoOYfNtt_1n2-MAphEgPWdldfz2Yk2PQg_c-kCuKgY6tIR1nxI/exec');

  final uriWithParams = uri.replace(queryParameters: param);

  try {
    final response = await http.get(uriWithParams);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Error: ${response.statusCode}';
    }
  } catch (e) {
    return 'Failed to load content ' + e.toString();
  }
}
