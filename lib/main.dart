import 'package:chalyaar/core/utils/color_constant.dart';
import 'package:chalyaar/core/utils/responsive.dart';
import 'package:chalyaar/presentation/dashboard_screen.dart';
import 'package:chalyaar/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
     
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor:ColorConstant.orange),
        useMaterial3: true,
      ),
      home:Responsive.isMobile(context)?DashboardScreen(): HomeScreen(),
    );
  }
}

