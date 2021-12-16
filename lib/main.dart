import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controllers/notifications.dart';
import 'package:misiontic_template/domain/use_case/location_management.dart';
import 'package:misiontic_template/domain/use_case/notification_management.dart';
import 'package:misiontic_template/ui/app.dart';
import 'package:workmanager/workmanager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 1. TO DO: Crea el controlador de notificaciones e inicializa el pluggin

  // 2. TO DO: 
  // Crea el canal para notificaciones 
  // notificationController.createChannel();

  // 4. TO DO:
  // Inicializa el Workmanager con el metodo creado y registra la tarea periodica
  
  runApp(const App());
}

// 3. TO DO:
// Crea un metodo que cree una tarea, obtenga la ubicación 
// y la muestre en una notificación
// void updatePositionInBackground() async {}
