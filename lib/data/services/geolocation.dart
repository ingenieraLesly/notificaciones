import 'package:geolocator/geolocator.dart';
import 'package:misiontic_template/domain/services/location.dart';

class GpsService implements LocationInterface {
  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }
}
