import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controllers/location.dart';
import 'package:misiontic_template/domain/use_case/controllers/notifications.dart';
import 'package:misiontic_template/domain/use_case/controllers/permissions.dart';
import 'package:misiontic_template/domain/use_case/location_management.dart';
import 'package:url_launcher/url_launcher.dart';

class GpsScreen extends StatefulWidget {
  const GpsScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

enum RadioState { on, off }

class _State extends State<GpsScreen> {
  late PermissionsController permissionsController;
  late LocationController locationController;
  late NotificationController notificationController;
  late LocationManager manager;

  @override
  void initState() {
    super.initState();
    permissionsController = Get.find();
    locationController = Get.find();
    notificationController = Get.find();
    manager = LocationManager();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  locationController.location.value = null;
                  if (permissionsController.locationGranted) {
                    final position = await manager.getCurrentLocation();
                    locationController.location.value = position;
                    notificationController.show(
                        title: 'Tu ubicación es...',
                        body:
                            'Latitud ${position.latitude} - Longitud: ${position.longitude}');
                  }
                },
                child: const Text('Obtener Ubicacion'),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Obx(
                () => ElevatedButton(
                  onPressed: locationController.location.value != null
                      ? () async {
                          final location = locationController.location.value;
                          final url =
                              "https://www.google.es/maps?q=${location?.latitude},${location?.longitude}";
                          await launch(url);
                        }
                      : null,
                  child: const Text('Abrir Maps'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
