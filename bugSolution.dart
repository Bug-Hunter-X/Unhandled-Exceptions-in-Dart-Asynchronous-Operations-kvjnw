```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          return jsonData;
        } else {
          print('Error: JSON response is not a list.');
          return null; // Or throw a custom exception
        }
      } catch (e) {
        print('Error decoding JSON: $e');
        return null; // Or throw a custom exception
      }
    } else {
      print('HTTP Error: ${response.statusCode} - ${response.reasonPhrase}');
      return null; // Or throw a custom exception
    }
  } catch (e) {
    print('Network Error: $e');
    return null; // Or throw a custom exception
  }
}
```