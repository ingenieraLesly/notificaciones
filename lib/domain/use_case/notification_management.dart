import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:misiontic_template/data/services/notification.dart';

class NotificationManager {
  final _service = NotificationService();

  // TODO
  //Inicializa el pluggin de notificaciones
  // initialize() async {  }


  // TODO
  //Crea el canal para notificaciones
  // NotificationDetails  createChannel();
  

  void showNotification(
      {required NotificationDetails channel,
      required String title,
      required String body}) async {
    await _service.showNotification(title: title, body: body, details: channel);
  }
}
