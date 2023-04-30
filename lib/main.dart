import 'package:expense_app/Screens/destop_screen.dart';
import 'package:expense_app/Screens/mobile_screen.dart';
import 'package:expense_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

var lightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);

void main() {
  runApp(
    MaterialApp(
      title: 'Expense App',
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        // appBarTheme: const AppBarTheme().copyWith(
        //   foregroundColor: darkColorScheme.primaryContainer,
        //   backgroundColor: darkColorScheme.onPrimaryContainer,
        // ),
        // cardTheme: const CardTheme().copyWith(
        //   color: darkColorScheme.secondaryContainer,
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkColorScheme.primaryContainer,
          ),
        ),
        // textTheme: ThemeData().textTheme.copyWith(
        //       titleMedium: const TextStyle().copyWith(
        //         color: darkColorScheme.onSecondaryContainer,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
      ),
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          foregroundColor: lightColorScheme.primaryContainer,
          backgroundColor: lightColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: lightColorScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleMedium: const TextStyle().copyWith(
                color: lightColorScheme.onSecondaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScreen: MobileScreen(),
      desktopScreen: DesktopScreen(),
    );
  }
}
