import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String flag; // url to country flag icon
  String url;
  String location; //location name for the ui
  late String time; //the time in that location

  WorldTime({required this.location, required this.flag, required this.url});

  //Future is like a Promise in Javascript,
  // for example, the mindset for the function above is:
  // at some point in time I will return void BUT only when this async function is fully complete
  Future<void> getTime() async {
    try {
      http.Response response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print('$datetime\n$offset');

      //create a DateTime Object
      DateTime now = DateTime.parse(datetime);
      time = now.add(Duration(hours: int.parse(offset))).toString();
    } catch (e) {
      time = 'could not get time';
      print('Cought Error: $e');
    }
  }
}
