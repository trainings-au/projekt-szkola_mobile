import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longtitude) async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longtitude";
    if (await launch(googleUrl)) {
    } else {
      throw "Nie można otworzyć mapy";
    }
  }
}
