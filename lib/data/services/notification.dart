import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:misiontic_template/domain/services/notification.dart';

class NotificationService implements NotificationInterface {
  final _plugin = FlutterLocalNotificationsPlugin();

  // TO DO  
  // Establece la configuración inicial e inicializa el pluggin FlutterLocalNotificationsPlugin
  // @override
  // Future<void> initialize() async {}

  // TO DO
  // Crea el canal para notificaciones con una importancia y prioridad maxima
  // @override
  // NotificationDetails createChannel()

  @override
  Future<void> showNotification(
      {required String title,
      required String body,
      required NotificationDetails details}) async {
    await _plugin.show(0, title, body, details);
  }
}
