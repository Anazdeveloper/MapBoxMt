import 'package:ateam_flutter_mt/data/local_storage/hive_helper.dart';
import 'package:ateam_flutter_mt/routes.dart';
import 'package:ateam_flutter_mt/screens/history/history_screen.dart';
import 'package:ateam_flutter_mt/screens/home/home_screen.dart';
import 'package:ateam_flutter_mt/screens/navigate_screen/arguments/navigate_screen_arguments.dart';
import 'package:ateam_flutter_mt/screens/navigate_screen/navigate_screen.dart';
import 'package:ateam_flutter_mt/widgets/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveHelper().registerAndInitHiveBoxes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        AppRoutes.home_screen: (context) => const HomeScreen(),
        AppRoutes.history_screen: (context) => const HistoryScreen(),
      },
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case AppRoutes.navigate_screen:
            return CustomRoute<bool>(
                builder: (context) =>
                    NavigateScreen(
                        arguments: settings.arguments as NavigateScreenArguments),
                settings: settings);
        }
      },
    );
  }
}
