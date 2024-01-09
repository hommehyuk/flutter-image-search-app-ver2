import 'package:flutter/material.dart';
import 'package:image_search_app2/di/di_setup.dart';
import 'package:image_search_app2/ui/main/main_screen.dart';
import 'package:image_search_app2/ui/main/main_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  diSetup();
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
      home: ChangeNotifierProvider(
        create: (_) => getIt<MainViewModel>(),
        child: const MainScreen(),
      ),
    );
  }
}
