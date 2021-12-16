import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controllers/location.dart';
import 'package:misiontic_template/domain/use_case/controllers/permissions.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';
import 'package:misiontic_template/domain/use_case/permission_management.dart';
import 'package:misiontic_template/domain/use_case/theme_management.dart';
import 'package:misiontic_template/ui/pages/stateful/gps_page.dart';
import 'package:misiontic_template/ui/theme/theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Dependency injection: setting up state management
  late final ThemeController controller = Get.put(ThemeController());
  // Theme management
  late final ThemeManager manager = ThemeManager();
  bool isLoaded = false;

  Future<void> initializeTheme() async {
    controller.darkMode = await manager.storedTheme;
    setState(() => isLoaded = true);
  }

  @override
  void initState() {
    ever(controller.reactiveDarkMode, (bool isDarkMode) {
      manager.changeTheme(isDarkMode: isDarkMode);
    });
    PermissionsController permissionsController =
        Get.put(PermissionsController());
    permissionsController.permissionManager = PermissionManager();
    Get.lazyPut(() => LocationController());
    initializeTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? const CircularProgressIndicator()
        : GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MyTheme.ligthTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: ThemeMode.system,
            home: GpsPage(),
          );
  }
}
